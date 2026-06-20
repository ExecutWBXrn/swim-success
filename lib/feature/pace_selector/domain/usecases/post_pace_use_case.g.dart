// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_pace_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// post pace use case provider

@ProviderFor(postPaceUseCase)
final postPaceUseCaseProvider = PostPaceUseCaseProvider._();

/// post pace use case provider

final class PostPaceUseCaseProvider
    extends
        $FunctionalProvider<PostPaceUseCase, PostPaceUseCase, PostPaceUseCase>
    with $Provider<PostPaceUseCase> {
  /// post pace use case provider
  PostPaceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postPaceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postPaceUseCaseHash();

  @$internal
  @override
  $ProviderElement<PostPaceUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostPaceUseCase create(Ref ref) {
    return postPaceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostPaceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostPaceUseCase>(value),
    );
  }
}

String _$postPaceUseCaseHash() => r'8524fe183a5c8c8deab4af50a993fef41ff100a1';
