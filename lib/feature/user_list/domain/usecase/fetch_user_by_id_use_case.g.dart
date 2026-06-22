// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_by_id_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// fetch user by id use case provider

@ProviderFor(fetchUserByIdUseCaseCall)
final fetchUserByIdUseCaseCallProvider = FetchUserByIdUseCaseCallFamily._();

/// fetch user by id use case provider

final class FetchUserByIdUseCaseCallProvider
    extends $FunctionalProvider<UserEntity?, UserEntity?, UserEntity?>
    with $Provider<UserEntity?> {
  /// fetch user by id use case provider
  FetchUserByIdUseCaseCallProvider._({
    required FetchUserByIdUseCaseCallFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'fetchUserByIdUseCaseCallProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUserByIdUseCaseCallHash();

  @override
  String toString() {
    return r'fetchUserByIdUseCaseCallProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<UserEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserEntity? create(Ref ref) {
    final argument = this.argument as String?;
    return fetchUserByIdUseCaseCall(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEntity?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserByIdUseCaseCallProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserByIdUseCaseCallHash() =>
    r'9e5fbec3de0a341343517ee5f5a85bce0dbe8408';

/// fetch user by id use case provider

final class FetchUserByIdUseCaseCallFamily extends $Family
    with $FunctionalFamilyOverride<UserEntity?, String?> {
  FetchUserByIdUseCaseCallFamily._()
    : super(
        retry: null,
        name: r'fetchUserByIdUseCaseCallProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// fetch user by id use case provider

  FetchUserByIdUseCaseCallProvider call(String? id) =>
      FetchUserByIdUseCaseCallProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchUserByIdUseCaseCallProvider';
}
