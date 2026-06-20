import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_colors.dart';

part 'theme.g.dart';

@riverpod
ThemeData theme(Ref _) => ThemeData(
  scaffoldBackgroundColor: AppColors().background,
  buttonTheme: ButtonThemeData(buttonColor: AppColors().beginner),
);
