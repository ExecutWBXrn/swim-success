import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/domain/usecase/fetch_user_list_use_case.dart';

part 'user_list_notifier.g.dart';

/// user list notifier
@riverpod
class UserListNotifier extends _$UserListNotifier {
  @override
  FutureOr<List<UserEntity>> build() async {
    final fetchUserListUseCase = ref.watch(fetchUserListUseCaseProvider);

    final entities = await fetchUserListUseCase();

    return entities.fold((failure) => throw failure, (users) => users);
  }

  /// refresh
  Future<void> refresh() async {
    ref.invalidateSelf();

    await future;
  }
}
