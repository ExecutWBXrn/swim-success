// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_remote_user_ds_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// data source provider

@ProviderFor(httpRemoteUserDs)
final httpRemoteUserDsProvider = HttpRemoteUserDsProvider._();

/// data source provider

final class HttpRemoteUserDsProvider
    extends
        $FunctionalProvider<
          HttpRemoteUserDs,
          HttpRemoteUserDs,
          HttpRemoteUserDs
        >
    with $Provider<HttpRemoteUserDs> {
  /// data source provider
  HttpRemoteUserDsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpRemoteUserDsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpRemoteUserDsHash();

  @$internal
  @override
  $ProviderElement<HttpRemoteUserDs> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpRemoteUserDs create(Ref ref) {
    return httpRemoteUserDs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpRemoteUserDs value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpRemoteUserDs>(value),
    );
  }
}

String _$httpRemoteUserDsHash() => r'71d16a81bc66330186ca9084de9d2f82d390e66b';
