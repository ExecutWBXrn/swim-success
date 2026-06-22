import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/user_list/domain/usecase/filter_user_use_case.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/query_notifier.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/user_list_notifier.dart';
import 'package:swim_success/shared/domain/enum/pace_state_enum.dart';

/// User list screen
class UserListScreen extends HookConsumerWidget {
  /// init
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersList = ref.watch(filterUserUseCaseCallProvider);
    final usersAsyncValue = ref.watch(userListProvider);
    final usersNotifier = ref.read(userListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (val) =>
                    ref.read(queryProvider.notifier).setQuery(val),
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.greenAccent.shade400,
                selectionControls: EmptyTextSelectionControls(),
                decoration: InputDecoration(
                  hintText: 'Search by name...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: WidgetStateColor.resolveWith((states) {
                    if (states.contains(WidgetState.focused)) {
                      return Colors.greenAccent.shade700.withAlpha(50);
                    }
                    return Colors.greenAccent.withAlpha(10);
                  }),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white70,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: usersAsyncValue.when(
                data: (_) => Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: RefreshIndicator(
                    onRefresh: usersNotifier.refresh,
                    color: Colors.white,
                    backgroundColor: context.theme.appColors.secondary,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: usersList.length,
                      separatorBuilder: (_, _) => const Divider(),
                      itemBuilder: (context, index) {
                        final user = usersList[index];

                        final color = switch (usersList[index].pace.stateType) {
                          PaceStateEnum.beginner =>
                            context.theme.appColors.beginner,
                          PaceStateEnum.intermediate =>
                            context.theme.appColors.intermediate,
                          PaceStateEnum.advanced =>
                            context.theme.appColors.advanced,
                          PaceStateEnum.elite => context.theme.appColors.elite,
                        };

                        return ListTile(
                          onTap: () async {
                            await context.pushNamed(
                              'UserDetails',
                              pathParameters: {'user_id': user.id.toString()},
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent.withAlpha(10),
                            child: Text(
                              user.name.substring(0, 1),
                              style: TextStyle(color: color),
                            ),
                          ),
                          title: Text(
                            user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.email,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              Text(
                                user.pace.stateType.name.toUpperCase(),
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.chevron_right),
                        );
                      },
                    ),
                  ),
                ),
                error: (e, st) => Center(
                  child: Column(
                    children: [
                      Text('Error: $e'),
                      TextButton(
                        onPressed: usersNotifier.refresh,
                        child: const Text('Refresh'),
                      ),
                    ],
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: context.theme.appColors.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
