import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/pace_selector/domain/usecases/post_pace_use_case.dart';

part 'post_pace_notifier.g.dart';

/// Post pace notifier
@riverpod
class PostPaceNotifier extends _$PostPaceNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(
      null,
    );
  }

  /// send pace
  Future<void> sendPace(int seconds) async {
    state = const AsyncLoading();

    final useCase = ref.watch(postPaceUseCaseProvider);

    final request = await useCase.call(seconds);

    request.fold(
      (failure) => AsyncError<dynamic>(
        failure.message ?? 'server error',
        StackTrace.current,
      ),
      (success) => const AsyncData(null),
    );
  }
}
