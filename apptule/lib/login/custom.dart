import 'package:flutter/material.dart';

/// Dibuja la cuadrícula de micropuntos del fondo
class DotGridPainter extends CustomPainter {
  final Color dotColor;
  final double spacing;
  final double radius;

  const DotGridPainter({
    this.dotColor = const Color(0xFF1C2B0E),
    this.spacing = 13.0,
    this.radius = 1.1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DotGridPainter oldDelegate) => false;
}

/// Dibuja la silueta de lomas/paisaje en la base
class HillSilhouettePainter extends CustomPainter {
  final Color hillColor;

  const HillSilhouettePainter({this.hillColor = const Color(0xFF2C3917)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = hillColor
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

/// Dibuja el isotipo de las tres cabezas de caballo/ganado
class CattleHeadIconPainter extends CustomPainter {
  final Color color;

  const CattleHeadIconPainter({this.color = const Color(0xFFEBDCA0)});

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
    path.lineTo(w * 0.72, h * 0.08); // oreja derecha
    path.lineTo(w * 0.58, h * 0.22);
    path.lineTo(w * 0.48, h * 0.12); // oreja izquierda
    path.lineTo(w * 0.38, h * 0.28);
    path.quadraticBezierTo(w * 0.22, h * 0.38, w * 0.20, h * 0.55);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CattleHeadIconPainter oldDelegate) => false;
}
