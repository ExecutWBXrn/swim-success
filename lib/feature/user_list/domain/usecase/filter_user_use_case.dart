import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/query_notifier.dart';
import 'package:swim_success/feature/user_list/presentation/notifiers/user_list_notifier.dart';

part 'filter_user_use_case.g.dart';

/// filter user use case call provider
@riverpod
List<UserEntity> filterUserUseCaseCall(Ref ref) {
  final asyncEntity = ref.watch(userListProvider);
  final query = ref.watch(queryProvider);
  return const FilterUserUseCase().call(asyncEntity, query);
}

/// filter users use case
final class FilterUserUseCase {
  /// init
  const FilterUserUseCase();

  /// call method
  List<UserEntity> call(
    AsyncValue<List<UserEntity>> asyncEntity,
    String query,
  ) {
    return asyncEntity.maybeWhen(
      data: (users) => users
          .where(
            (user) => user.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList(),
      orElse: () => [],
    );
  }
}
