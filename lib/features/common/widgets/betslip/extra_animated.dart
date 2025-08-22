import 'package:flutter/material.dart';

class ExtraAnimated extends StatelessWidget {
  final bool? isExpanded;
  final Animation<double>? animation;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const ExtraAnimated({
    super.key,
    this.isExpanded,
    this.animation,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    if (isExpanded != null) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: isExpanded! ? 1.0 : 0.0),
        duration: duration,
        curve: curve,
        builder: (context, v, child) => _buildChild(v, child),
        child: child,
      );
    } else if (animation != null) {
      return AnimatedBuilder(
        animation: animation!,
        builder: (context, child) => _buildChild(animation!.value, child),
        child: child,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildChild(double v, Widget? child) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: v,
        child: Opacity(
          opacity: v,
          child: Transform.translate(
            offset: Offset(0, (1 - v) * -30),
            child: Transform.scale(scale: 0.95 + (v * 0.05), child: child),
          ),
        ),
      ),
    );
  }
}
