import 'package:flutter/material.dart';

class CustomizedPaint extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paint = Paint();
    paint.color = const Color(0xFFEFE1D0);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.lineTo(0, height*0.20);
    path.quadraticBezierTo(width*0.02, height*0.16, width*0.1, height*0.16);
    path.lineTo(width*0.9, height*0.16);
    path.quadraticBezierTo(width*0.98, height*0.16, width, height*0.20);
    path.lineTo(width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  // path.lineTo(0, height*0.16);
  // path.quadraticBezierTo(width*0.02, height*0.12, width*0.1, height*0.12);
  // path.lineTo(width*0.9, height*0.12);
  // path.quadraticBezierTo(width*0.98, height*0.12, width, height*0.16);
  // path.lineTo(width, 0);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
