// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// user list notifier

@ProviderFor(UserListNotifier)
final userListProvider = UserListNotifierProvider._();

/// user list notifier
final class UserListNotifierProvider
    extends $AsyncNotifierProvider<UserListNotifier, List<UserEntity>> {
  /// user list notifier
  UserListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userListNotifierHash();

  @$internal
  @override
  UserListNotifier create() => UserListNotifier();
}

String _$userListNotifierHash() => r'0b6e61ed201b322bfa5ee3b3c116f9f6f31fc763';

/// user list notifier

abstract class _$UserListNotifier extends $AsyncNotifier<List<UserEntity>> {
  FutureOr<List<UserEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserEntity>>, List<UserEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserEntity>>, List<UserEntity>>,
              AsyncValue<List<UserEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
