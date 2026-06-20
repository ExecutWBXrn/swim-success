import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swim_success/core/canvas/thumb_border_component_canvas.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';

class PaceLevelSlider extends HookConsumerWidget {
  const PaceLevelSlider({super.key});

  static const double minSliderTimeSec = 45;
  static const double maxSliderTimeSec = 240;

  Widget buildTickMark(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 5, width: 2.5, color: Colors.white54),
        const SizedBox(height: 4),
        OverflowBox(
          maxWidth: 50,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> sliderVal = useState<double>(240);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        padding: EdgeInsets.zero,
        trackHeight: 3,
        activeTrackColor: Colors.white12,
        inactiveTrackColor: Colors.white12,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: ThumbBorderComponentCanvas(
          borderColor: Colors.white,
          thumbColor: Colors.blue,
        ),
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Elite",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Advanced",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Intermediate",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Beginner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.theme.appColors.beginner,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.appColors.elite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 40),
                      SizedOverflowBox(
                        size: Size(0, 0),
                        child: Text(
                          "1:10",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.appColors.advanced,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 40),
                      SizedOverflowBox(
                        size: Size(0, 0),
                        child: Text(
                          "1:30",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.appColors.intermediate,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 40),
                      SizedOverflowBox(
                        size: Size(0, 0),
                        child: Text(
                          "2:00",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.appColors.beginner,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Slider(
                  min: minSliderTimeSec,
                  max: maxSliderTimeSec,
                  value: sliderVal.value,
                  onChanged: (double value) {
                    sliderVal.value = value;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
