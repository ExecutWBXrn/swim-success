import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/feature/pace_selector/domain/entities/pace_entity.dart';

part 'pace_notifier.g.dart';

/// user pace notifier
@riverpod
class PaceNotifier extends _$PaceNotifier {
  @override
  PaceEntity build() {
    return PaceEntity.fromSeconds(240);
  }

  bool _isValidRange(double value) {
    return value > 0.0 && value < 3600.0;
  }

  /// changing user pace
  void changePace(double newPace) {
    if (!_isValidRange(newPace)) return;
    state = PaceEntity.fromSeconds(newPace);
  }

  /// changing user pace minutes
  void changeMinutes(int minutes) {
    final secondsPart = state.seconds % 60;
    final newState = (minutes * 60) + secondsPart;

    if (!_isValidRange(newState)) return;
    state = PaceEntity.fromSeconds(newState);
  }

  /// changing user pace seconds
  void changeSeconds(int seconds) {
    final minutesPart = (state.seconds / 60).floor();
    final newState = (minutesPart * 60) + seconds.toDouble();

    if (!_isValidRange(newState)) return;
    state = PaceEntity.fromSeconds(newState);
  }

  /// increment
  void increment({int seconds = 1}) {
    final newState = state.seconds + seconds;
    if (!_isValidRange(newState)) return;
    state = PaceEntity.fromSeconds(newState);
  }

  /// decrement
  void decrement({int seconds = 1}) {
    final newState = state.seconds - seconds;
    if (!_isValidRange(newState)) return;
    state = PaceEntity.fromSeconds(newState);
  }
}
