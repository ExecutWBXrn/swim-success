import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/domain/usecase/fetch_user_list_use_case.dart';

part 'user_list_notifier.g.dart';

/// user list notifier
@riverpod
class UserListNotifier extends _$UserListNotifier {
  late final FetchUserListUseCase _fetchUserListUseCase;

  @override
  FutureOr<List<UserEntity>> build() {
    _fetchUserListUseCase = ref.read(fetchUserListUseCaseProvider);
    return [];
  }

  /// load users / refresh
  Future<void> loadUsers() async {
    state = const AsyncLoading();

    final entities = await _fetchUserListUseCase();

    entities.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (users) {
        state = AsyncValue.data(users);
      },
    );
  }
}
