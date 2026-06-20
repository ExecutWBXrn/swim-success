import 'package:flutter/material.dart';

/// let get any [ThemeData] through [BuildContext].[theme]
extension ThemeExtension on BuildContext {
  /// getter
  ThemeData get theme => Theme.of(this);
}
