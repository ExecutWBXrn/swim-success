import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/failure/failure.dart';
import 'package:swim_success/feature/pace_selector/data/datasource/remote_ds/http_remote_ds.dart';
import 'package:swim_success/feature/pace_selector/data/datasource/remote_ds/http_remote_ds_impl.dart';

part 'post_pace_use_case.g.dart';

/// post pace use case provider
@riverpod
PostPaceUseCase postPaceUseCase(Ref ref) {
  final ds = ref.watch(httpRemoteDsImplProvider);
  return PostPaceUseCase(remoteDs: ds);
}

/// Post pace use case
final class PostPaceUseCase {
  /// post pace use case
  const PostPaceUseCase({required this.remoteDs});

  ///  remoteDs
  final HttpRemoteDs remoteDs;

  /// method call
  Future<Either<Failure, void>> call(int seconds) async {
    return remoteDs.postRequest(seconds);
  }
}
