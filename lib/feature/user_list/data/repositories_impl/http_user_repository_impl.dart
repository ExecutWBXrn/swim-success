import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/feature/user_list/data/datasource/remote_ds/http_remote_user_ds.dart';
import 'package:swim_success/feature/user_list/data/datasource/remote_ds/http_remote_user_ds_impl.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/feature/user_list/domain/repositories/http_user_repository.dart';

part 'http_user_repository_impl.g.dart';

/// httpUserRepositoryImpl provider
@riverpod
HttpUserRepository httpUserRepositoryImpl(Ref ref) =>
    HttpUserRepositoryImpl(remoteUserDs: ref.watch(httpRemoteUserDsProvider));

/// Http user repository implements [HttpUserRepository]
final class HttpUserRepositoryImpl implements HttpUserRepository {
  /// init
  const HttpUserRepositoryImpl({
    required HttpRemoteUserDs remoteUserDs,
  }) : _remoteUserDs = remoteUserDs;

  final HttpRemoteUserDs _remoteUserDs;

  @override
  Future<Either<Failure, List<UserEntity>>> fetchListOfUserEntities() async {
    final models = await _remoteUserDs.fetchUsers();

    return models.fold(
      (failure) {
        return Either.left(failure);
      },
      (success) {
        final entities = success.map((model) => model.toEntity()).toList();
        return Either.right(entities);
      },
    );
  }
}
