import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

void main() => runApp(const GenieApp());

class GenieApp extends StatelessWidget {
  const GenieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genie Effect Fix V5',
      debugShowCheckedModeBanner: false,
      home: const GeniePage(),
    );
  }
}

class GeniePage extends StatefulWidget {
  const GeniePage({super.key});
  @override
  State<GeniePage> createState() => _GeniePageState();
}

class _GeniePageState extends State<GeniePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _t;
  final _dockKey = GlobalKey();

  final Size _panelSize = const Size(280, 360);
  Offset? _dockCenterOnScreen;
  bool _isMinimized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 920),
      reverseDuration: const Duration(milliseconds: 720),
    );
    _t = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
      reverseCurve: Curves.easeOutCubic,
    );
    _controller.addStatusListener((s) {
      if (s == AnimationStatus.completed) _isMinimized = true;
      if (s == AnimationStatus.dismissed) _isMinimized = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _measureDock());
  }

  void _measureDock() {
    final ctx = _dockKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final topLeft = box.localToGlobal(Offset.zero);
    setState(
      () => _dockCenterOnScreen = topLeft + box.size.center(Offset.zero),
    );
  }

  void _onTapPanel() {
    if (_dockCenterOnScreen == null) _measureDock();
    if (!_isMinimized) _controller.forward(from: 0);
  }

  void _onTapDock() {
    if (_isMinimized) _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final startCenter = Offset(screen.width / 2, screen.height / 2);
    final dockCenter =
        _dockCenterOnScreen ?? Offset(screen.width - 70, screen.height - 70);

    final moveVec = dockCenter - startCenter;
    final panelStartLeft = startCenter.dx - _panelSize.width / 2;
    final rawPull = (dockCenter.dx - panelStartLeft) / _panelSize.width;
    final pullToX = rawPull.clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color(0xFFe9e9e9),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _t,
            builder: (_, __) {
              final p = _t.value;

              final dir = (dockCenter - startCenter);
              final signX = dir.dx.sign;
              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.0012)
                ..rotateX(-0.20 * p)
                ..rotateY(0.12 * p * signX);

              final scale = lerpDouble(1.0, 0.62, p)!;
              final translate = Offset(moveVec.dx * p, moveVec.dy * p);

              return Transform.translate(
                offset: translate,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: transform,
                  child: Transform.scale(
                    scaleX: scale,
                    scaleY: scale,
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: GestureDetector(
                        onTap: _onTapPanel,
                        child: ClipPath(
                          clipper: _GenieClipperV5(
                            progress: p,
                            pullToX: pullToX,
                            cornerRadius: 12,
                          ),
                          child: Container(
                            width: _panelSize.width,
                            height: _panelSize.height,
                            decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 16,
                                  spreadRadius: 2,
                                  offset: Offset(0, 6),
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              p < 0.02 ? 'Tap to minimize' : 'Minimizing...',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Dock 目标按钮
          Positioned(
            right: 24,
            bottom: 28,
            child: GestureDetector(
              onTap: _onTapDock,
              child: Container(
                key: _dockKey,
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xff2d7ef7),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 6),
                      color: Colors.black26,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  _isMinimized ? Icons.unfold_less : Icons.folder,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _GenieClipperV5 extends CustomClipper<Path> {
  final double progress; // 0..1
  final double pullToX; // 0..1 target X on bottom
  final double cornerRadius;

  _GenieClipperV5({
    required this.progress,
    required this.pullToX,
    this.cornerRadius = 12,
  });

  // 使用一个更平滑的缓动函数，如 S 形曲线
  double _smoothstep(double t) => t * t * t * (t * (t * 6 - 15) + 10);

  @override
  Path getClip(Size size) {
    final p = progress.clamp(0.0, 1.0);
    final w = size.width;
    final h = size.height;

    if (p <= 1e-6) {
      return Path()..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, w, h),
          Radius.circular(cornerRadius),
        ),
      );
    }

    // ---------- 调参旋钮（可以根据需要微调） ----------
    final liftFactor = 0.82; // 底部上提总体比例
    final ampFactor = 0.50; // S 波振幅比例
    final sideInsetMax = math.min(w * 0.12, 30.0); // 侧边最大内缩量
    final neckMin = math.max(12.0, w * 0.08); // 颈部最窄宽度（像素）
    final topPinchMax = w * 0.15; // 新增：顶部最大内缩量
    // --------------------------------------------------

    final smoothP = _smoothstep(p);
    final ampProgress = _smoothstep(1 - p);

    final baseY = h - (h * liftFactor * smoothP);
    final amp = h * ampFactor * ampProgress;
    final cuspX = (w * pullToX).clamp(0.0, w);
    final neckWidth = lerpDouble(w, neckMin, smoothP)!;

    double nLTarget = (cuspX - neckWidth / 2).clamp(0.0, w);
    double nRTarget = (cuspX + neckWidth / 2).clamp(0.0, w);

    final sideInset = lerpDouble(0.0, sideInsetMax, smoothP)!;
    nLTarget = nLTarget.clamp(sideInset, w - sideInset);
    nRTarget = nRTarget.clamp(sideInset, w - sideInset);

    if (nRTarget - nLTarget < neckMin * 0.22) {
      final mid = (nRTarget + nLTarget) / 2;
      nLTarget = (mid - neckMin * 0.11).clamp(sideInset, w - sideInset);
      nRTarget = (mid + neckMin * 0.11).clamp(sideInset, w - sideInset);
    }

    final nxL = lerpDouble(0.0, nLTarget, smoothP)!;
    final nxR = lerpDouble(w, nRTarget, smoothP)!;

    final topCtrlY = lerpDouble(0.0, h * 0.1, smoothP)!;
    final leftTopCtrl = Offset(lerpDouble(0.0, nxL, 0.4)!, topCtrlY);
    final leftMidCtrl = Offset(nxL, baseY);
    final rightTopCtrl = Offset(lerpDouble(w, nxR, 0.4)!, topCtrlY);
    final rightMidCtrl = Offset(nxR, baseY);

    final double cuspTangentAngle = lerpDouble(0, math.pi * 0.4, p)!;
    final double cuspTangentLength = lerpDouble(w * 0.1, 0, p)!;

    final c2l = Offset(
      cuspX - cuspTangentLength * math.cos(cuspTangentAngle),
      h - cuspTangentLength * math.sin(cuspTangentAngle),
    );
    final c2r = Offset(
      cuspX + cuspTangentLength * math.cos(cuspTangentAngle),
      h - cuspTangentLength * math.sin(cuspTangentAngle),
    );

    final c1l = Offset(
      lerpDouble(nxL, c2l.dx, 0.6)!,
      lerpDouble(baseY, c2l.dy, 0.6)!,
    );
    final c1r = Offset(
      lerpDouble(nxR, c2r.dx, 0.6)!,
      lerpDouble(baseY, c2r.dy, 0.6)!,
    );

    final topPinch = lerpDouble(0.0, topPinchMax, smoothP)!;
    final topL = Offset(topPinch, 0);
    final topR = Offset(w - topPinch, 0);

    final path = Path()
      ..moveTo(topL.dx, topL.dy)
      ..lineTo(topR.dx, topR.dy)
      ..cubicTo(
        rightTopCtrl.dx,
        rightTopCtrl.dy,
        rightMidCtrl.dx,
        rightMidCtrl.dy,
        nxR,
        baseY,
      )
      ..cubicTo(c1r.dx, c1r.dy, c2r.dx, c2r.dy, cuspX, h)
      ..cubicTo(c2l.dx, c2l.dy, c1l.dx, c1l.dy, nxL, baseY)
      ..cubicTo(
        leftMidCtrl.dx,
        leftMidCtrl.dy,
        leftTopCtrl.dx,
        leftTopCtrl.dy,
        topL.dx,
        topL.dy,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant _GenieClipperV5 old) {
    // 只有当 progress、pullToX 或 cornerRadius 改变时，才重新绘制剪裁路径。
    return old.progress != progress ||
        old.pullToX != pullToX ||
        old.cornerRadius != cornerRadius;
  }
}
