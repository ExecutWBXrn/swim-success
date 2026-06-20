import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/canvas/thumb_border_component_canvas.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/pace_selector/domain/enum/pace_state_enum.dart';
import 'package:swim_success/feature/pace_selector/presentation/notifiers/pace_notifier.dart';

/// Slider which defines level of user
class PaceLevelSlider extends HookConsumerWidget {
  /// init
  const PaceLevelSlider({super.key});

  /// min slider value
  static const double minSliderTimeSec = 0;

  /// max slider value
  static const double maxSliderTimeSec = 1;

  int _valToSec(double val) {
    if (val >= 2 / 3) {
      // 2:00 - 4:00 (120 - 240 sec)
      return (120 + (val - 2 / 3) * 360).round();
    } else if (val >= 1 / 3) {
      // 1:30 - 2:00 (90 - 120 sec)
      return (90 + (val - 1 / 3) * 90).round();
    } else if (val >= 1 / 9) {
      // 1:10 - 1:30 (70 - 90 sec)
      return (70 + (val - 1 / 9) * 90).round();
    } else {
      // 0:45 - 1:10 (45 - 70 sec)
      return (45 + val * 225).round();
    }
  }

  double _secToVal(double sec) {
    if (sec >= 120) {
      // 120 - 240 sec -> 2/3 до 1.0
      return 2 / 3 + (sec - 120) / 360;
    } else if (sec >= 90) {
      // 90 - 120 sec -> 1/3 до 2/3
      return 1 / 3 + (sec - 90) / 90;
    } else if (sec >= 70) {
      // 70 - 90 sec -> 1/9 до 1/3
      return 1 / 9 + (sec - 70) / 90;
    } else {
      // 45 - 70 sec -> 0.0 до 1/9
      return (sec - 45) / 225;
    }
  }

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
          color: isCurrent ? color : Colors.white54,
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
    final paceValue = ref.watch(paceProvider);
    final paceNotifier = ref.read(paceProvider.notifier);

    /// if pace out of range of slider then it takes verge value
    final sliderValue = paceValue.seconds < 45
        ? minSliderTimeSec
        : paceValue.seconds > 240
        ? maxSliderTimeSec
        : _secToVal(paceValue.seconds);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        padding: EdgeInsets.zero,
        trackHeight: 3,
        activeTrackColor: Colors.transparent,
        inactiveTrackColor: Colors.transparent,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: ThumbBorderComponentCanvas(
          borderColor: Colors.white,
          thumbColor: switch (paceValue.stateType) {
            PaceStateEnum.beginner => context.theme.appColors.beginner,
            PaceStateEnum.intermediate => context.theme.appColors.intermediate,
            PaceStateEnum.advanced => context.theme.appColors.advanced,
            PaceStateEnum.elite => context.theme.appColors.elite,
          },
        ),
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _textLevelOverSlider(
                'Elite',
                color: context.theme.appColors.elite,
                isCurrent: paceValue.stateType == PaceStateEnum.elite,
              ),
              _textLevelOverSlider(
                'Advanced',
                flex: 2,
                color: context.theme.appColors.advanced,
                isCurrent: paceValue.stateType == PaceStateEnum.advanced,
              ),
              _textLevelOverSlider(
                'Intermediate',
                flex: 3,
                color: context.theme.appColors.intermediate,
                isCurrent: paceValue.stateType == PaceStateEnum.intermediate,
              ),
              _textLevelOverSlider(
                'Beginner',
                flex: 3,
                color: context.theme.appColors.beginner,
                isCurrent: paceValue.stateType == PaceStateEnum.beginner,
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
                  value: sliderValue,
                  onChanged: (val) {
                    paceNotifier.changePace(_valToSec(val).toDouble());
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
