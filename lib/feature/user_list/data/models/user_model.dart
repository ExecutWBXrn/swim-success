import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swim_success/feature/user_list/domain/entities/user_entity.dart';
import 'package:swim_success/shared/domain/entities/pace_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User Model
@freezed
abstract class UserModel with _$UserModel {
  /// init
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) = _UserModel;

  const UserModel._();

  /// from json
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      pace: PaceEntity.fromSeconds((Random().nextInt(196) + 45).toDouble()),
    );
  }
}
