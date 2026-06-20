import 'package:flutter/material.dart';

/// custom thumb for slider which let define border
class ThumbBorderComponentCanvas extends SliderComponentShape {
  /// initialization
  const ThumbBorderComponentCanvas({
    required this.borderColor,
    required this.thumbColor,
    this.radius = 8,
    this.borderWidth = 6,
  });

  /// radius of thumb
  final double radius;

  /// border width
  final double borderWidth;

  /// border color
  final Color borderColor;

  /// thumbColor
  final Color thumbColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas
      ..drawCircle(center, radius, thumbPaint)
      ..drawCircle(center, radius, borderPaint);
  }
}
