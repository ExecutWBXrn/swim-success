// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_remote_ds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// http remote ds provider

@ProviderFor(httpRemoteDs)
final httpRemoteDsProvider = HttpRemoteDsProvider._();

/// http remote ds provider

final class HttpRemoteDsProvider
    extends $FunctionalProvider<HttpRemoteDs, HttpRemoteDs, HttpRemoteDs>
    with $Provider<HttpRemoteDs> {
  /// http remote ds provider
  HttpRemoteDsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpRemoteDsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpRemoteDsHash();

  @$internal
  @override
  $ProviderElement<HttpRemoteDs> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpRemoteDs create(Ref ref) {
    return httpRemoteDs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpRemoteDs value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpRemoteDs>(value),
    );
  }
}

String _$httpRemoteDsHash() => r'80deb0b731e60bd035fc444c2ea760698b8bd0bc';
