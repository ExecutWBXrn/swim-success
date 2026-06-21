import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/core/services/http_service.dart';
import 'package:swim_success/feature/pace_selector/data/datasource/remote_ds/http_remote_ds.dart';

part 'http_remote_ds_impl.g.dart';

/// http remote ds provider
@riverpod
HttpRemoteDs httpRemoteDsImpl(Ref ref) {
  final dio = ref.watch(dioProvider);
  return HttpRemoteDsImpl(dio: dio);
}

/// Http remote ds implementation
final class HttpRemoteDsImpl implements HttpRemoteDs {
  /// impl
  const HttpRemoteDsImpl({required this.dio});

  /// dio
  final Dio dio;

  @override
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
        ),
      );
    } catch (e) {
      return Either.left(
        ServerFailure(
          code: 400,
        ),
      );
    }
  }
}
