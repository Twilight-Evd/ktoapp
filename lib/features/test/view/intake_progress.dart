import 'package:flutter/material.dart';
import 'dart:math';

class WaterIntakeProgress extends StatefulWidget {
  const WaterIntakeProgress({super.key});

  @override
  State<WaterIntakeProgress> createState() => _WaterIntakeProgressState();
}

class _WaterIntakeProgressState extends State<WaterIntakeProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF67576c),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(250, 250),
                  painter: WaterIntakePainter(
                    greenAngle: _controller.value * 2 * pi,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "100%",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Water Intake",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withValues(alpha: .9),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff803dec),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class WaterIntakePainter extends CustomPainter {
  final double greenAngle;
  WaterIntakePainter({required this.greenAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const startAngle = -pi / 2;

    final shadowPaint = Paint()
      ..color = Colors.red.withValues(alpha: .5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center.translate(3, 3), radius: radius),
      startAngle,
      2 * pi,
      false,
      shadowPaint,
    );

    // 蓝色渐变圆环
    final gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * pi,
      colors: [
        Color.fromRGBO(92, 132, 183, 1),
        Color.fromRGBO(39, 78, 129, 1),
        Colors.blue.shade800,
        Color.fromRGBO(148, 191, 238, 1),
        Color.fromRGBO(92, 132, 183, 1),
      ],
    );
    final ringPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi,
      false,
      ringPaint,
    );

    final greenPaint = Paint()
      ..color = Color.fromRGBO(146, 202, 124, 1)
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    const greenSweep = pi / 2;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + greenAngle,
      greenSweep,
      false,
      greenPaint,
    );
  }

  @override
  bool shouldRepaint(covariant WaterIntakePainter oldDelegate) {
    return oldDelegate.greenAngle != greenAngle;
  }
}
