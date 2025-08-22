// themes/app_shapes.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class AppShapes extends ThemeExtension<AppShapes> {
  final double small;
  final double medium;
  final double large;

  AppShapes(this.small, this.medium, this.large);

  static AppShapes normal() => AppShapes(4, 8, 12);

  @override
  AppShapes copyWith() => AppShapes(small, medium, large);

  @override
  AppShapes lerp(ThemeExtension<AppShapes>? other, double t) {
    if (other is! AppShapes) return this;
    return AppShapes(
      lerpDouble(small, other.small, t)!,
      lerpDouble(medium, other.medium, t)!,
      lerpDouble(large, other.large, t)!,
    );
  }
}
