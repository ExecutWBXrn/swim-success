import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/user_list_notifier.dart';

part 'fetch_user_by_id_use_case.g.dart';

/// fetch user by id use case provider
@riverpod
UserEntity? fetchUserByIdUseCaseCall(Ref ref, String? id) {
  final asyncEntity = ref.watch(userListProvider);

  return FetchUserByIdUseCase().call(asyncEntity, id);
}

/// fetch user by id use case
class FetchUserByIdUseCase {
  /// call method
  UserEntity? call(AsyncValue<List<UserEntity>> asyncEntity, String? id) {
    if (id == null) return null;

    return asyncEntity.maybeWhen(
      data: (users) => users.where((user) => user.id.toString() == id).first,
      orElse: () => null,
    );
  }
}
