import 'package:fpdart/fpdart.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';

/// Http user repository
abstract interface class HttpUserRepository {
  /// fetching list of user entities
  Future<Either<Failure, List<UserEntity>>> fetchListOfUserEntities();
}
