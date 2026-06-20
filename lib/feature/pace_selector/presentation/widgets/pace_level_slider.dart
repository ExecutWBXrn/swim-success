import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/canvas/thumb_border_component_canvas.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';

/// Slider which defines level of user
class PaceLevelSlider extends HookConsumerWidget {
  /// init
  const PaceLevelSlider({super.key});

  /// min slider value
  static const double minSliderTimeSec = 45;

  /// max slider value
  static const double maxSliderTimeSec = 240;

  /// tick under slider
  Widget _buildTickMark(String label) {
    return Column(
      children: [
        const SizedBox(height: 40),
        SizedOverflowBox(
          size: Size.zero,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }

  /// text that defines user level over slider
  Widget _textLevelOverSlider(
    String label, {
    int flex = 1,
    Color? color,
    bool isCurrent = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color ?? Colors.white54,
          fontSize: isCurrent ? 13 : 11,
          fontWeight: isCurrent ? FontWeight.w900 : null,
        ),
      ),
    );
  }

  /// color part of slider
  Widget _sliderColorPart({
    required Color color,
    int flex = 1,
    double height = 3,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderVal = useState<double>(240);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        padding: EdgeInsets.zero,
        trackHeight: 3,
        activeTrackColor: Colors.white12,
        inactiveTrackColor: Colors.white12,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: const ThumbBorderComponentCanvas(
          borderColor: Colors.white,
          thumbColor: Colors.blue,
        ),
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _textLevelOverSlider('Elite'),
              _textLevelOverSlider('Advanced', flex: 2),
              _textLevelOverSlider('Intermediate', flex: 3),
              _textLevelOverSlider(
                'Beginner',
                flex: 3,
                color: context.theme.appColors.beginner,
                isCurrent: true,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  _sliderColorPart(color: context.theme.appColors.elite),
                  _buildTickMark('1:10'),
                  _sliderColorPart(
                    color: context.theme.appColors.advanced,
                    flex: 2,
                  ),
                  _buildTickMark('1:30'),
                  _sliderColorPart(
                    color: context.theme.appColors.intermediate,
                    flex: 3,
                  ),
                  _buildTickMark('2:00'),
                  _sliderColorPart(
                    color: context.theme.appColors.beginner,
                    flex: 3,
                  ),
                ],
              ),
              Positioned(
                child: Slider(
                  min: minSliderTimeSec,
                  max: maxSliderTimeSec,
                  value: sliderVal.value,
                  onChanged: (value) {
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
