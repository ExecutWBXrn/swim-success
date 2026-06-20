import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/router/router.dart';
import 'package:swim_success/core/theme/theme.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(),
      ],
      child: _MyApp(),
    ),
  );
}

class _MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ref.read(themeProvider),
      routerConfig: ref.read(routerProvider),
    );
  }
}
