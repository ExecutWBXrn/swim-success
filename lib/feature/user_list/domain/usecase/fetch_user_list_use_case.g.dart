// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_list_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// use case provider

@ProviderFor(fetchUserListUseCase)
final fetchUserListUseCaseProvider = FetchUserListUseCaseProvider._();

/// use case provider

final class FetchUserListUseCaseProvider
    extends
        $FunctionalProvider<
          FetchUserListUseCase,
          FetchUserListUseCase,
          FetchUserListUseCase
        >
    with $Provider<FetchUserListUseCase> {
  /// use case provider
  FetchUserListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserListUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchUserListUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchUserListUseCase create(Ref ref) {
    return fetchUserListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchUserListUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchUserListUseCase>(value),
    );
  }
}

String _$fetchUserListUseCaseHash() =>
    r'a8ccb97a2d5337262867ef017e36397540543c8c';
