// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pace_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// user pace notifier

@ProviderFor(PaceNotifier)
final paceProvider = PaceNotifierProvider._();

/// user pace notifier
final class PaceNotifierProvider
    extends $NotifierProvider<PaceNotifier, PaceEntity> {
  /// user pace notifier
  PaceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paceNotifierHash();

  @$internal
  @override
  PaceNotifier create() => PaceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaceEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaceEntity>(value),
    );
  }
}

String _$paceNotifierHash() => r'ff931e3e2c451e2bde7e2943fb417e484fcb7079';

/// user pace notifier

abstract class _$PaceNotifier extends $Notifier<PaceEntity> {
  PaceEntity build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PaceEntity, PaceEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaceEntity, PaceEntity>,
              PaceEntity,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
