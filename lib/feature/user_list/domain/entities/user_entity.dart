import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_success/shared/domain/entities/pace_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// converter PaceEntity toJson/fromJson
class PaceEntityConverter implements JsonConverter<PaceEntity, dynamic> {
  /// init
  const PaceEntityConverter();

  @override
  PaceEntity fromJson(dynamic json) =>
      PaceEntity.fromSeconds((Random().nextInt(196) + 45).toDouble());

  @override
  dynamic toJson(PaceEntity entity) => {
    'seconds': entity.seconds,
    'type': entity.stateType.name,
  };
}

/// User Entity
@freezed
abstract class UserEntity with _$UserEntity {
  /// init
  const factory UserEntity({
    required int id,
    required String name,
    required String email,
    required String phone,
    @PaceEntityConverter() required PaceEntity pace,
  }) = _UserEntity;

  const UserEntity._();

  /// from json
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
