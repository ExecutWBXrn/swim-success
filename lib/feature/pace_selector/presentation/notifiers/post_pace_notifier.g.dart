// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_pace_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Post pace notifier

@ProviderFor(PostPaceNotifier)
final postPaceProvider = PostPaceNotifierProvider._();

/// Post pace notifier
final class PostPaceNotifierProvider
    extends $NotifierProvider<PostPaceNotifier, AsyncValue<void>> {
  /// Post pace notifier
  PostPaceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postPaceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postPaceNotifierHash();

  @$internal
  @override
  PostPaceNotifier create() => PostPaceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$postPaceNotifierHash() => r'd458841e1555570c169e351d41e9bd3ee913afbb';

/// Post pace notifier

abstract class _$PostPaceNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
