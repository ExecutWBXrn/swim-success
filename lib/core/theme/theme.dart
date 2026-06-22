import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swim_success/core/theme/app_colors.dart';

part 'theme.g.dart';

/// Main theme of application
@riverpod
ThemeData theme(Ref _) => ThemeData(
  scaffoldBackgroundColor: AppColors().background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors().background,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: ButtonThemeData(buttonColor: AppColors().beginner),
);
