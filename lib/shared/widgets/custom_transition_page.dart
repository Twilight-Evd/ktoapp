import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType {
  fade,
  scale,
  slideLeft,
  slideUp,
  rotate3D,
  blur,
  blurZoom,
}

CustomTransitionPage<T> myTransitionPage<T>(
  Widget child, {
  required GoRouterState state,
  PageTransitionType type = PageTransitionType.fade,
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    transitionDuration: duration,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (type) {
        case PageTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);

        case PageTransitionType.scale:
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: child,
          );

        case PageTransitionType.slideLeft:
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeOut)),
            ),
            child: child,
          );

        case PageTransitionType.slideUp:
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeOut)),
            ),
            child: child,
          );

        case PageTransitionType.rotate3D:
          final rotate = Tween(
            begin: -1.0,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeOut)).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            builder: (context, _) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(rotate.value),
                alignment: Alignment.center,
                child: child,
              );
            },
          );

        case PageTransitionType.blur:
          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              final blurValue = (1 - animation.value) * 10; // 最大模糊 10
              return Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurValue,
                      sigmaY: blurValue,
                    ),
                    child: Container(color: Colors.black.withOpacity(0.05)),
                  ),
                  FadeTransition(opacity: animation, child: child),
                ],
              );
            },
          );

        case PageTransitionType.blurZoom:
          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              final blurValue = (1 - animation.value) * 10;
              final scaleValue = 0.9 + (animation.value * 0.1); // 0.9 → 1.0
              return Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: blurValue,
                      sigmaY: blurValue,
                    ),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.05),
                    ),
                  ),
                  Transform.scale(
                    scale: scaleValue,
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                ],
              );
            },
          );
      }
    },
  );
}
