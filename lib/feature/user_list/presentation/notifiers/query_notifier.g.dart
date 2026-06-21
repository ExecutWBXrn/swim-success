// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QueryNotifier)
final queryProvider = QueryNotifierProvider._();

final class QueryNotifierProvider
    extends $NotifierProvider<QueryNotifier, String> {
  QueryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queryNotifierHash();

  @$internal
  @override
  QueryNotifier create() => QueryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$queryNotifierHash() => r'2171a66ae0a884ba65831030bba257618610e843';

abstract class _$QueryNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
