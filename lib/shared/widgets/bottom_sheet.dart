import 'package:flutter/material.dart';
import 'package:ktoapp/core/utils/screen_helper.dart';

class NonModalBottomSheet {
  static OverlayEntry? _entry;
  static AnimationController? _controller;
  static late Animation<Offset> _slide;
  static bool _isClosing = false;
  static double _currentBottom = 0;
  static double? initBottom;

  static void show(
    BuildContext context, {
    required Widget child,
    bool dismissOnTapOutside = false,
    Duration animationDuration = const Duration(milliseconds: 300),
    double elevation = 2,
    Color? backgroundColor = Colors.transparent,
    BorderRadius borderRadius = const BorderRadius.vertical(
      top: Radius.circular(16),
    ),
    double? maxHeight,
    double? bottom,
  }) {
    if (_entry != null) return;

    _currentBottom = bottom ?? ScreenHelper.navigationBarHeight(context);
    initBottom = _currentBottom;

    final overlayState = Overlay.of(context);

    _controller = AnimationController(
      vsync: overlayState,
      duration: animationDuration,
      reverseDuration: animationDuration,
    );

    final curve = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(curve);

    _entry = OverlayEntry(
      builder: (ctx) {
        return AnimatedBuilder(
          animation: _controller!,
          builder: (context, _) {
            return Stack(
              children: [
                if (dismissOnTapOutside)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => close(),
                      behavior: HitTestBehavior.translucent,
                      child: const SizedBox(),
                    ),
                  ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: _currentBottom,
                  child: SlideTransition(
                    position: _slide,
                    child: Material(
                      type: MaterialType.transparency,
                      elevation: elevation,
                      borderRadius: borderRadius,
                      clipBehavior: Clip.antiAlias,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              maxHeight ??
                              MediaQuery.of(context).size.height * 0.8,
                        ),
                        child: SingleChildScrollView(
                          physics: TopBouncingScrollPhysics(),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    overlayState.insert(_entry!);
    _controller!.forward();
  }

  static Future<void> close() async {
    if (_entry == null || _controller == null) return;
    if (_isClosing) return;
    _isClosing = true;

    try {
      await _controller!.reverse();
    } catch (_) {}

    _entry?.remove();
    _entry = null;

    _controller?.dispose();
    _controller = null;
    _isClosing = false;
  }

  static bool get isShowing => _entry != null && !_isClosing;

  static void updateBottom(double newBottom) {
    if (_entry == null) return;
    _currentBottom = newBottom;
    _entry!.markNeedsBuild();
  }

  static void resetBottom() {
    if (_entry == null || initBottom == null) return;
    _currentBottom = initBottom!;
    _entry!.markNeedsBuild();
  }
}

class TopBouncingScrollPhysics extends ClampingScrollPhysics {
  const TopBouncingScrollPhysics({super.parent});

  @override
  TopBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return TopBouncingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return 0.0;
    }
    if (value > position.pixels &&
        position.pixels >= position.maxScrollExtent) {
      return value - position.pixels;
    }
    return super.applyBoundaryConditions(position, value);
  }
}
