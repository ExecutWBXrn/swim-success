// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_remote_ds_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// http remote ds provider

@ProviderFor(httpRemoteDsImpl)
final httpRemoteDsImplProvider = HttpRemoteDsImplProvider._();

/// http remote ds provider

final class HttpRemoteDsImplProvider
    extends $FunctionalProvider<HttpRemoteDs, HttpRemoteDs, HttpRemoteDs>
    with $Provider<HttpRemoteDs> {
  /// http remote ds provider
  HttpRemoteDsImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpRemoteDsImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpRemoteDsImplHash();

  @$internal
  @override
  $ProviderElement<HttpRemoteDs> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpRemoteDs create(Ref ref) {
    return httpRemoteDsImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpRemoteDs value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpRemoteDs>(value),
    );
  }
}

String _$httpRemoteDsImplHash() => r'8bbbf7bdf2457a20fabe67d109ad19ebe0ffbace';
