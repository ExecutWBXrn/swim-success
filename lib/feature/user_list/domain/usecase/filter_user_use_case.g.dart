// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_user_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// filter user use case call provider

@ProviderFor(filterUserUseCaseCall)
final filterUserUseCaseCallProvider = FilterUserUseCaseCallProvider._();

/// filter user use case call provider

final class FilterUserUseCaseCallProvider
    extends
        $FunctionalProvider<
          List<UserEntity>,
          List<UserEntity>,
          List<UserEntity>
        >
    with $Provider<List<UserEntity>> {
  /// filter user use case call provider
  FilterUserUseCaseCallProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterUserUseCaseCallProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterUserUseCaseCallHash();

  @$internal
  @override
  $ProviderElement<List<UserEntity>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<UserEntity> create(Ref ref) {
    return filterUserUseCaseCall(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserEntity>>(value),
    );
  }
}

String _$filterUserUseCaseCallHash() =>
    r'1918dbcdb0b1e7d6ec9ad8e68c1ab5a498a283e6';
