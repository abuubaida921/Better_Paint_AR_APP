// Custom painter to draw lines on the image
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final List<Offset> points;
  LinePainter(this.points,);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =  Colors.red
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    if (points.length > 1) {
      for (int i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
