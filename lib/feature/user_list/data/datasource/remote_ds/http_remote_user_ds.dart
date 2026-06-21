import 'package:fpdart/fpdart.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/feature/user_list/data/models/user_model.dart';

/// data source of fetching users out of API
abstract interface class HttpRemoteUserDs {
  /// fetch list of users out of API
  Future<Either<Failure, List<UserModel>>> fetchUsers();
}
