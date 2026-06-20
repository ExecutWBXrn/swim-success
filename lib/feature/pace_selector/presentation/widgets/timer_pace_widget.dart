import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/feature/pace_selector/presentation/widgets/widgets.dart';

/// timer to set a user swim pace
class TimerPaceWidget extends HookConsumerWidget {
  const TimerPaceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final minutesTextFormController = useTextEditingController(
      text: 1.toString(),
    );
    final secondsTextFormController = useTextEditingController(
      text: 35.toString(),
    );

    return Column(
      children: [
        const Text(
          "YOUR PACE",
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
              TimeCellWidget(textEditingController: minutesTextFormController),
              Text(
                ":",
                style: TextStyle(
                  color: Colors.greenAccent.shade400,
                  fontSize: 100,
                ),
              ),
              TimeCellWidget(textEditingController: secondsTextFormController),
            ],
          ),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "MIN : SEC",
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 20),
            Text(
              "/",
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 20),
            Text(
              "100M",
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
