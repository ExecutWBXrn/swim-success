import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/theme/app_colors.dart';

part 'theme.g.dart';

/// Main theme of application
@riverpod
ThemeData theme(Ref _) => ThemeData(
  scaffoldBackgroundColor: AppColors().background,
  buttonTheme: ButtonThemeData(buttonColor: AppColors().beginner),
);
