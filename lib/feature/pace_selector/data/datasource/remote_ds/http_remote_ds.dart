import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/core/services/http_service.dart';

part 'http_remote_ds.g.dart';

/// http remote ds provider
@riverpod
HttpRemoteDs httpRemoteDs(Ref ref) {
  final dio = ref.watch(dioProvider);
  return HttpRemoteDs(dio: dio);
}

/// Http remote ds
class HttpRemoteDs {
  /// impl
  HttpRemoteDs({required this.dio});

  /// dio
  final Dio dio;

  /// post request
  Future<Either<Failure, void>> postRequest(int seconds) async {
    try {
      await dio.post<Map<String, dynamic>>(
        'posts',
        data: {'pace_seconds': seconds},
      );

      return Either.right(null);
    } on DioException catch (e) {
      return Either.left(
        ServerFailure(
          code: e.response?.statusCode ?? 500,
          message:
              e.response?.statusMessage ?? e.message ?? 'Unknown Server Error',
        ),
      );
    } catch (e) {
      return Either.left(
        ServerFailure(
          code: 0,
          message: e.toString(),
        ),
      );
    }
  }
}
