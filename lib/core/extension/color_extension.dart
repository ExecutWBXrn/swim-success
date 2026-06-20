import 'package:flutter/material.dart';
import 'package:swim_success/core/theme/app_colors.dart';

/// let get any [AppColors] through [ThemeData].[appColors]
extension ColorExtension on ThemeData {
  /// getter
  AppColors get appColors => AppColors();
}
