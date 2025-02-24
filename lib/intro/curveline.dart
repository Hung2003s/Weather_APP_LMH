import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Curveline extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;

    final path = Path();
    path.moveTo(0, size.height * 0.9);

    path.quadraticBezierTo(
      size.width / 2, // Điểm điều khiển x
      -size.height * 0.3, // Điểm điều khiển y (âm để cong lên)
      size.width, // Điểm kết thúc x
      size.height * 0.9, // Điểm kết thúc y
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
