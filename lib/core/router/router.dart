import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'router_export_screens.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref _) => GoRouter(
  initialLocation: '/pace_selector',
  routes: [
    GoRoute(
      path: '/pace_selector',
      name: 'PaceSelector',
      builder: (context, state) {
        return PaceSelectorScreen();
      },
    ),
  ],
);
