import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color selectionColor;
  final Color onSelectionColor;
  final Color onSelectionOddsColor;
  final Color selectionSelectedColor;
  final Color onSelectionSelectedColor;
  final Color onSelectionOddsSelectedColor;

  final Color oddsUpColor;
  final Color oddsDownColor;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  final Color keyboardBackgroundColor;
  final Color keyboardSelectionColor;
  final Color keyboardKeyColor;

  const AppColors({
    required this.selectionColor,
    required this.onSelectionColor,
    required this.onSelectionOddsColor,
    required this.selectionSelectedColor,
    required this.onSelectionSelectedColor,
    required this.onSelectionOddsSelectedColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.oddsUpColor,
    required this.oddsDownColor,
    required this.keyboardBackgroundColor,
    required this.keyboardSelectionColor,
    required this.keyboardKeyColor,
  });

  @override
  AppColors copyWith({
    Color? selectionColor,
    Color? onSelectionColor,
    Color? onSelectionOddsColor,
    Color? selectionSelectedColor,
    Color? onSelectionSelectedColor,
    Color? onSelectionOddsSelectedColor,
    Color? oddsUpColor,
    Color? oddsDownColor,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Color? keyboardBackgroundColor,
    Color? keyboardSelectionColor,
    Color? keyboardKeyColor,
  }) {
    return AppColors(
      selectionColor: selectionColor ?? this.selectionColor,
      onSelectionColor: onSelectionColor ?? this.onSelectionColor,
      onSelectionOddsColor: onSelectionOddsColor ?? this.onSelectionOddsColor,
      selectionSelectedColor:
          selectionSelectedColor ?? this.selectionSelectedColor,
      onSelectionSelectedColor:
          onSelectionSelectedColor ?? this.onSelectionSelectedColor,
      onSelectionOddsSelectedColor:
          onSelectionOddsSelectedColor ?? this.onSelectionOddsSelectedColor,
      oddsUpColor: oddsUpColor ?? this.oddsUpColor,
      oddsDownColor: oddsDownColor ?? this.oddsDownColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
      keyboardBackgroundColor:
          keyboardBackgroundColor ?? this.keyboardBackgroundColor,
      keyboardSelectionColor:
          keyboardSelectionColor ?? this.keyboardSelectionColor,
      keyboardKeyColor: keyboardKeyColor ?? this.keyboardKeyColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      selectionColor: Color.lerp(selectionColor, other.selectionColor, t)!,
      onSelectionColor: Color.lerp(
        onSelectionColor,
        other.onSelectionColor,
        t,
      )!,
      onSelectionOddsColor: Color.lerp(
        onSelectionOddsColor,
        other.onSelectionOddsColor,
        t,
      )!,
      selectionSelectedColor: Color.lerp(
        selectionSelectedColor,
        other.selectionSelectedColor,
        t,
      )!,
      onSelectionSelectedColor: Color.lerp(
        onSelectionSelectedColor,
        other.onSelectionSelectedColor,
        t,
      )!,
      onSelectionOddsSelectedColor: Color.lerp(
        onSelectionOddsSelectedColor,
        other.onSelectionOddsSelectedColor,
        t,
      )!,
      oddsUpColor: Color.lerp(oddsUpColor, other.oddsUpColor, t)!,
      oddsDownColor: Color.lerp(oddsDownColor, other.oddsDownColor, t)!,
      shimmerBaseColor: Color.lerp(
        shimmerBaseColor,
        other.shimmerBaseColor,
        t,
      )!,
      shimmerHighlightColor: Color.lerp(
        shimmerHighlightColor,
        other.shimmerHighlightColor,
        t,
      )!,
      keyboardBackgroundColor: Color.lerp(
        keyboardBackgroundColor,
        other.keyboardBackgroundColor,
        t,
      )!,
      keyboardSelectionColor: Color.lerp(
        keyboardSelectionColor,
        other.keyboardSelectionColor,
        t,
      )!,
      keyboardKeyColor: Color.lerp(
        keyboardKeyColor,
        other.keyboardKeyColor,
        t,
      )!,
    );
  }

  static AppColors light() => AppColors(
    selectionColor: const Color(0xFFF5F5F5),
    onSelectionColor: const Color(0xff383838),
    onSelectionOddsColor: const Color(0xfffad749),
    selectionSelectedColor: const Color(0xfffad749),
    onSelectionSelectedColor: const Color(0xff383838),
    onSelectionOddsSelectedColor: const Color(0xff383838),
    oddsUpColor: const Color(0xff00934b),
    oddsDownColor: const Color(0xfff12a2a),
    shimmerBaseColor: Colors.grey.shade300,
    shimmerHighlightColor: Colors.grey.shade100,
    keyboardBackgroundColor: const Color.fromARGB(255, 245, 222, 130),
    keyboardSelectionColor: const Color(0xfffad749),
    keyboardKeyColor: const Color(0xFF404040),
  );

  static AppColors dark() => AppColors(
    selectionColor: const Color(0xff383838),
    onSelectionColor: Colors.white,
    onSelectionOddsColor: const Color(0xfffad749),
    selectionSelectedColor: const Color(0xfffad749),
    onSelectionSelectedColor: const Color(0xff383838),
    onSelectionOddsSelectedColor: const Color(0xff383838),
    oddsUpColor: const Color(0xff00934b),
    oddsDownColor: const Color(0xfff12a2a),
    shimmerBaseColor: Colors.grey.shade600,
    shimmerHighlightColor: Colors.grey.shade500,
    keyboardBackgroundColor: const Color(0xFF2a2a2a),
    keyboardSelectionColor: const Color(0xFF404040),
    keyboardKeyColor: Colors.white,
  );
}
