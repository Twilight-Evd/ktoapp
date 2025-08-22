// themes/app_spacing.dart
import 'dart:ui';

import 'package:flutter/material.dart';

class AppSpacing extends ThemeExtension<AppSpacing> {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  AppSpacing(this.xs, this.sm, this.md, this.lg, this.xl);

  static AppSpacing normal() => AppSpacing(4, 8, 16, 24, 32);

  @override
  AppSpacing copyWith() {
    return AppSpacing(xs, sm, md, lg, xl);
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      lerpDouble(xs, other.xs, t)!,
      lerpDouble(sm, other.sm, t)!,
      lerpDouble(md, other.md, t)!,
      lerpDouble(lg, other.lg, t)!,
      lerpDouble(xl, other.xl, t)!,
    );
  }
}
