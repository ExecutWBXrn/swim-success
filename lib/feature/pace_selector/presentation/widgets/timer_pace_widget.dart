import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/pace_selector/presentation/notifiers/pace_notifier.dart';
import 'package:swim_success/feature/pace_selector/presentation/widgets/widgets.dart';

/// timer to set a user swim pace
class TimerPaceWidget extends HookConsumerWidget {
  /// init
  const TimerPaceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final paceValue = ref.watch(paceProvider);

    final minutesWithoutSeconds = (paceValue.seconds / 60).floor();
    final secondsWithoutMinutes = (paceValue.seconds % 60).floor();

    final minutesTextFormController = useTextEditingController();
    final secondsTextFormController = useTextEditingController();

    final minutesFocusNode = useFocusNode();
    final secondsFocusNode = useFocusNode();

    useListenable(secondsFocusNode);

    useEffect(() {
      void formatSeconds() {
        if (!secondsFocusNode.hasFocus) {
          final currentSec = int.tryParse(secondsTextFormController.text) ?? 0;
          final secStr = currentSec < 10
              ? '0$currentSec'
              : currentSec.toString();

          if (secondsTextFormController.text != secStr) {
            secondsTextFormController.text = secStr;
          }
        }
      }

      secondsFocusNode.addListener(formatSeconds);
      return () => secondsFocusNode.removeListener(formatSeconds);
    }, [secondsFocusNode]);

    useEffect(() {
      final minStr = minutesWithoutSeconds.toString();
      final secStr = secondsWithoutMinutes < 10
          ? '0$secondsWithoutMinutes'
          : secondsWithoutMinutes.toString();

      if (!minutesFocusNode.hasFocus &&
          minutesTextFormController.text != minStr) {
        minutesTextFormController.text = minStr;
      }

      if (!secondsFocusNode.hasFocus &&
          secondsTextFormController.text != secStr) {
        secondsTextFormController.text = secStr;
      }

      return null;
    }, [paceValue]);

    return Column(
      children: [
        const Text(
          'YOUR PACE',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Form(
          key: formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TimeCellWidget(
                textEditingController: minutesTextFormController,
                isSeconds: false,
                focusNode: minutesFocusNode,
              ),
              Text(
                ':',
                style: TextStyle(
                  color: context.theme.appColors.secondary,
                  fontSize: 100,
                ),
              ),
              TimeCellWidget(
                textEditingController: secondsTextFormController,
                focusNode: secondsFocusNode,
              ),
            ],
          ),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MIN : SEC',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 20),
            Text(
              '/',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 20),
            Text(
              '100M',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
