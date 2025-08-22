import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_shapes.dart';
import 'app_spacing.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Brightness get brightness => theme.brightness;
  AppColors get colors => theme.extension<AppColors>()!;
  AppSpacing get spacing => theme.extension<AppSpacing>()!;
  AppShapes get shapes => theme.extension<AppShapes>()!;
}

extension ThemeModeExtension on ThemeMode {
  ThemeData get toThemeData {
    switch (this) {
      case ThemeMode.dark:
        return ThemeData.dark();
      case ThemeMode.light:
        return ThemeData.light();
      default:
        final brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        return brightness == Brightness.dark
            ? ThemeData.dark()
            : ThemeData.light();
    }
  }
}
