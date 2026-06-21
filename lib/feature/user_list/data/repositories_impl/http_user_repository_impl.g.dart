// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_user_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// httpUserRepositoryImpl provider

@ProviderFor(httpUserRepositoryImpl)
final httpUserRepositoryImplProvider = HttpUserRepositoryImplProvider._();

/// httpUserRepositoryImpl provider

final class HttpUserRepositoryImplProvider
    extends
        $FunctionalProvider<
          HttpUserRepository,
          HttpUserRepository,
          HttpUserRepository
        >
    with $Provider<HttpUserRepository> {
  /// httpUserRepositoryImpl provider
  HttpUserRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpUserRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpUserRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<HttpUserRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HttpUserRepository create(Ref ref) {
    return httpUserRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpUserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpUserRepository>(value),
    );
  }
}

String _$httpUserRepositoryImplHash() =>
    r'b7bf242bb5fbd5ad5eab75b632b14ebf815eda6d';
