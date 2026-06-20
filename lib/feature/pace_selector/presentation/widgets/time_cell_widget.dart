import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/feature/pace_selector/presentation/notifiers/pace_notifier.dart';

/// Time cell of timer pace widget
class TimeCellWidget extends ConsumerWidget {
  /// init
  const TimeCellWidget({
    required this.focusNode,
    required this.textEditingController,
    this.isSeconds = true,
    super.key,
  });

  /// cell controller
  final TextEditingController textEditingController;

  /// focus node
  final FocusNode focusNode;

  /// if true then its seconds cell, else if false then its minutes cell
  final bool isSeconds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paceNotifier = ref.read(paceProvider.notifier);

    return Column(
      children: [
        /// arrow up
        TextButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            if (isSeconds) {
              paceNotifier.increment();
            } else {
              paceNotifier.increment(seconds: 60);
            }
          },
          style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.compact,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 40,
          ),
        ),

        /// cell with number
        IntrinsicWidth(
          child: SizedBox(
            height: 120,
            child: TextFormField(
              onChanged: (str) {
                final val = int.tryParse(str.trim()) ?? 0;
                if (isSeconds) {
                  paceNotifier.changeSeconds(val);
                } else {
                  paceNotifier.changeMinutes(val);
                }
              },
              validator: (val) {
                if ((val?.trim().length ?? 0) > 2) {
                  return 'must be less than 3 nums';
                }
                return null;
              },
              focusNode: focusNode,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}$')),
              ],
              controller: textEditingController,
              maxLines: null,
              expands: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              cursorColor: Colors.greenAccent.shade400,
              selectionControls: EmptyTextSelectionControls(),
              decoration: InputDecoration(
                filled: true,
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return Colors.greenAccent.shade700.withAlpha(50);
                  }
                  return Colors.greenAccent.withAlpha(10);
                }),
                isCollapsed: false,
                focusColor: Colors.greenAccent.shade700,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),

        /// arrow down
        TextButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            if (isSeconds) {
              paceNotifier.decrement();
            } else {
              paceNotifier.decrement(seconds: 60);
            }
          },
          style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.compact,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }
}
