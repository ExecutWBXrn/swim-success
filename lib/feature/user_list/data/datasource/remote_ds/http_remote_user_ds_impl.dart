import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/core/services/http_service.dart';
import 'package:swim_success/feature/user_list/data/datasource/remote_ds/http_remote_user_ds.dart';
import 'package:swim_success/feature/user_list/data/models/user_model.dart';

part 'http_remote_user_ds_impl.g.dart';

/// data source provider
@riverpod
HttpRemoteUserDs httpRemoteUserDs(Ref ref) =>
    HttpRemoteUserDsImpl(dio: ref.watch(dioProvider));

/// data source impl of [HttpRemoteUserDs]
final class HttpRemoteUserDsImpl implements HttpRemoteUserDs {
  /// init
  HttpRemoteUserDsImpl({
    required this.dio,
  });

  /// dio
  final Dio dio;

  @override
  Future<Either<Failure, List<UserModel>>> fetchUsers() async {
    try {
      final response = await dio.get<List<Map<String, dynamic>>>('users');

      final statusCode = response.statusCode;

      if (statusCode == null) {
        return Either.left(NetworkFailure(code: 0));
      } else if (statusCode >= 500) {
        return Either.left(ServerFailure(code: statusCode));
      } else if (statusCode >= 400) {
        return Either.left(ClientFailure(code: statusCode));
      }

      final data = response.data;

      if (data == null || data.isEmpty) {
        return Either.right([]);
      }

      final listOfModels = data.map(UserModel.fromJson).toList();

      return Either.right(listOfModels);
    } on DioException catch (e) {
      return Either.left(NetworkFailure(code: e.response?.statusCode ?? 0));
    } catch (e) {
      return Either.left(ClientFailure(code: 400));
    }
  }
}
