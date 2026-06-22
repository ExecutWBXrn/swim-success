import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/user_list/domain/usecase/fetch_user_by_id_use_case.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/user_list_notifier.dart';
import 'package:swim_success/shared/domain/enum/pace_state_enum.dart';

/// User detain screen
class UserDetailScreen extends HookConsumerWidget {
  /// init
  const UserDetailScreen({this.id, super.key});

  /// id of user
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserByIdUseCaseCallProvider(id));
    final usersAsyncValue = ref.watch(userListProvider);

    final isUserNull = user == null;

    final color = isUserNull
        ? Colors.white
        : switch (user.pace.stateType) {
            PaceStateEnum.beginner => context.theme.appColors.beginner,
            PaceStateEnum.intermediate => context.theme.appColors.intermediate,
            PaceStateEnum.advanced => context.theme.appColors.advanced,
            PaceStateEnum.elite => context.theme.appColors.elite,
          };

    return Scaffold(
      appBar: AppBar(
        title: Text(isUserNull ? 'User Details' : user.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: usersAsyncValue.when(
            data: (_) => Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.greenAccent.withAlpha(10),
                    child: isUserNull
                        ? const Icon(Icons.person, size: 50)
                        : Text(
                            user.name.substring(0, 1),
                            style: TextStyle(color: color, fontSize: 50),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isUserNull ? 'no name' : user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  isUserNull ? '-' : user.pace.stateType.name.toUpperCase(),
                  style: TextStyle(
                    color: isUserNull ? Colors.grey : color,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white24,
                  child: Column(
                    children: [
                      _buildDetailTile(
                        Icons.email,
                        'Email',
                        isUserNull ? '-' : user.email,
                        color,
                      ),
                      const Divider(height: 1),
                      _buildDetailTile(
                        Icons.phone,
                        'Phone',
                        isUserNull ? '-' : user.phone,
                        color,
                      ),
                      const Divider(height: 1),
                      _buildDetailTile(
                        Icons.workspace_premium,
                        'Level',
                        isUserNull
                            ? '-'
                            : user.pace.stateType.name.toUpperCase(),
                        color,
                      ),
                      const Divider(height: 1),
                      _buildDetailTile(
                        Icons.language,
                        'SEC / 100M',
                        isUserNull ? '-' : user.pace.seconds.toString(),
                        color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            error: (e, st) => Center(
              child: Text('Error: $e'),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: context.theme.appColors.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTile(
    IconData icon,
    String label,
    String value,
    Color valueColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: valueColor),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white54,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: valueColor,
        ),
      ),
    );
  }
}
