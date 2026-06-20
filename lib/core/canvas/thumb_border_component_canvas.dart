import 'package:flutter/material.dart';

class ThumbBorderComponentCanvas extends SliderComponentShape {
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final Color thumbColor;

  const ThumbBorderComponentCanvas({
    this.radius = 8,
    this.borderWidth = 6,
    required this.borderColor,
    required this.thumbColor,
  });

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

    canvas.drawCircle(center, radius, thumbPaint);
    canvas.drawCircle(center, radius, borderPaint);
  }
}
