import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/router/router.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(ProviderScope(child: _MyApp()));
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
