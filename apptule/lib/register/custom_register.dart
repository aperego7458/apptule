// ==========================================
// PAINTERS REUTILIZABLES
// ==========================================

import 'package:flutter/material.dart';

class RegisterDotGridPainter extends CustomPainter {
  const RegisterDotGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1C2B0E)
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += 13.0) {
      for (double x = 0; x < size.width; x += 13.0) {
        canvas.drawCircle(Offset(x, y), 1.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RegisterHillsPainter extends CustomPainter {
  const RegisterHillsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2C3917)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.45);
    path.lineTo(size.width * 0.25, size.height * 0.58);
    path.lineTo(size.width * 0.50, size.height * 0.32);
    path.lineTo(size.width * 0.78, size.height * 0.54);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RegisterCattleHeadPainter extends CustomPainter {
  final Color color;

  const RegisterCattleHeadPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.20, h * 0.55);
    path.quadraticBezierTo(w * 0.08, h * 0.65, w * 0.22, h * 0.82);
    path.quadraticBezierTo(w * 0.35, h * 0.95, w * 0.55, h * 0.98);
    path.lineTo(w * 0.88, h * 0.98);
    path.lineTo(w * 0.88, h * 0.65);
    path.quadraticBezierTo(w * 0.82, h * 0.35, w * 0.68, h * 0.28);
    path.lineTo(w * 0.72, h * 0.08);
    path.lineTo(w * 0.58, h * 0.22);
    path.lineTo(w * 0.48, h * 0.12);
    path.lineTo(w * 0.38, h * 0.28);
    path.quadraticBezierTo(w * 0.22, h * 0.38, w * 0.20, h * 0.55);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
