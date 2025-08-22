import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

class TriangleIndicator extends StatelessWidget {
  final bool isUp;
  final double width;
  final double height;

  const TriangleIndicator({
    super.key,
    required this.isUp,
    this.width = 8,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.colors;

    return CustomPaint(
      size: Size(width, height),
      painter: TrianglePainter(
        isUp: isUp,
        color: isUp ? appColors.oddsUpColor : appColors.oddsDownColor,
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final bool isUp;
  final Color color;

  TrianglePainter({required this.isUp, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    if (isUp) {
      path.moveTo(size.width / 2, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width / 2, size.height);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
