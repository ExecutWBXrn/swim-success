import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Time cell of timer pace widget
class TimeCellWidget extends ConsumerWidget {
  const TimeCellWidget({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
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
        IntrinsicWidth(
          child: Container(
            height: 120,
            child: TextFormField(
              controller: textEditingController,
              maxLines: null,
              minLines: null,
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white12, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
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
