import 'package:flutter/material.dart';
import 'package:swim_success/shared/domain/enum/pace_state_enum.dart';

/// pace entity
@immutable
final class PaceEntity {
  /// init
  const PaceEntity({
    required this.stateType,
    required this.seconds,
  });

  /// init form seconds
  factory PaceEntity.fromSeconds(double seconds) {
    var type = PaceStateEnum.elite;

    if (seconds > 120) {
      type = PaceStateEnum.beginner;
    } else if (seconds > 90) {
      type = PaceStateEnum.intermediate;
    } else if (seconds > 70) {
      type = PaceStateEnum.advanced;
    }

    return PaceEntity(stateType: type, seconds: seconds);
  }

  /// sec
  final double seconds;

  /// stateType
  final PaceStateEnum stateType;
}
