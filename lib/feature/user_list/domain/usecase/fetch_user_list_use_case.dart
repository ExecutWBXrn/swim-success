import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/feature/user_list/data/repositories_impl/http_user_repository_impl.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/domain/repositories/http_user_repository.dart';

part 'fetch_user_list_use_case.g.dart';

/// use case provider
@riverpod
FetchUserListUseCase fetchUserListUseCase(Ref ref) =>
    FetchUserListUseCase(repository: ref.watch(httpUserRepositoryImplProvider));

/// fetching list of users use case
final class FetchUserListUseCase {
  /// init
  const FetchUserListUseCase({
    required HttpUserRepository repository,
  }) : _repository = repository;

  final HttpUserRepository _repository;

  /// call method
  Future<Either<Failure, List<UserEntity>>> call() async {
    final result = await _repository.fetchListOfUserEntities();

    return result.fold(Either.left, Either.right);
  }
}
