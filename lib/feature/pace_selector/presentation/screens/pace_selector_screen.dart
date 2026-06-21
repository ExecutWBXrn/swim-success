import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/pace_selector/domain/enum/pace_state_enum.dart';
import 'package:swim_success/feature/pace_selector/domain/usecases/post_pace_use_case.dart';
import 'package:swim_success/feature/pace_selector/presentation/notifiers/pace_notifier.dart';
import 'package:swim_success/feature/pace_selector/presentation/notifiers/post_pace_notifier.dart';
import 'package:swim_success/feature/pace_selector/presentation/widgets/widgets.dart';

/// pace selector screen with 100m fastest user run
class PaceSelectorScreen extends ConsumerWidget {
  /// init
  const PaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paceValue = ref.watch(paceProvider);

    ref.listen(postPaceProvider, (prev, next) async {
      if (next.isLoading) {
        await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (_) => Dialog(
            backgroundColor: Colors.white54,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: switch (paceValue.stateType) {
                        PaceStateEnum.beginner =>
                          context.theme.appColors.beginner,
                        PaceStateEnum.intermediate =>
                          context.theme.appColors.intermediate,
                        PaceStateEnum.advanced =>
                          context.theme.appColors.advanced,
                        PaceStateEnum.elite => context.theme.appColors.elite,
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Завантаження...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (prev?.isLoading == true) {
        Navigator.of(context).pop();

        if (next.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Помилка: ${next.error}'),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Дані успішно збережено!')),
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'What is your fastest 100m freestyle?',
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'This helps build more accurate plan for you',
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                const SizedBox(height: 25),
                const TimerPaceWidget(),
                const SizedBox(height: 35),
                const Text(
                  'THAT PUTS YOU AT',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  switch (paceValue.stateType) {
                    PaceStateEnum.beginner => 'Beginner',
                    PaceStateEnum.intermediate => 'Intermediate',
                    PaceStateEnum.advanced => 'Advanced',
                    PaceStateEnum.elite => 'Elite',
                  },
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: switch (paceValue.stateType) {
                      PaceStateEnum.beginner =>
                        context.theme.appColors.beginner,
                      PaceStateEnum.intermediate =>
                        context.theme.appColors.intermediate,
                      PaceStateEnum.advanced =>
                        context.theme.appColors.advanced,
                      PaceStateEnum.elite => context.theme.appColors.elite,
                    },
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: PaceLevelSlider(),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(postPaceProvider.notifier)
                        .sendPace(paceValue.seconds.toInt());
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      switch (paceValue.stateType) {
                        PaceStateEnum.beginner =>
                          context.theme.appColors.beginner,
                        PaceStateEnum.intermediate =>
                          context.theme.appColors.intermediate,
                        PaceStateEnum.advanced =>
                          context.theme.appColors.advanced,
                        PaceStateEnum.elite => context.theme.appColors.elite,
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          color: context.theme.appColors.background,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: context.theme.appColors.background,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "I don't know my pace, skip this",
                    style: TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white70,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
