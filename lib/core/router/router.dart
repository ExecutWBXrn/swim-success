import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/router/router_export_screens.dart';

part 'router.g.dart';

/// the router of an application
@riverpod
GoRouter router(Ref _) => GoRouter(
  initialLocation: '/pace_selector',
  routes: [
    GoRoute(
      path: '/pace_selector',
      name: 'PaceSelector',
      builder: (context, state) {
        return const PaceSelectorScreen();
      },
    ),
    GoRoute(
      path: '/user_list',
      name: 'UserList',
      builder: (context, state) {
        return const UserListScreen();
      },
    ),
    GoRoute(
      path: '/user_list/:user_id',
      name: 'UserDetails',
      builder: (context, state) {
        final id = state.pathParameters['user_id'];

        return UserDetailScreen(
          id: id,
        );
      },
    ),
  ],
);
