import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final bool loading;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool isCircle;
  final Widget? child;
  final Duration duration;
  final Widget? placeholder;

  const ShimmerWidget._({
    required this.loading,
    this.placeholder,
    this.width,
    this.height,
    this.borderRadius = 4,
    this.isCircle = false,
    this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  factory ShimmerWidget.box({
    required bool loading,
    double width = double.infinity,
    required double height,
    double borderRadius = 4,
    Widget? child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return ShimmerWidget._(
      loading: loading,
      width: width,
      height: height,
      borderRadius: borderRadius,
      isCircle: false,
      duration: duration,
      child: child,
    );
  }

  factory ShimmerWidget.text({
    required bool loading,
    double width = 100,
    double height = 16,
    Widget? child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return ShimmerWidget._(
      loading: loading,
      width: width,
      height: height,
      isCircle: false,
      duration: duration,
      child: child,
    );
  }

  factory ShimmerWidget.avatar({
    required bool loading,
    double size = 40,
    Widget? child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return ShimmerWidget._(
      loading: loading,
      width: size,
      height: size,
      isCircle: true,
      duration: duration,
      child: child,
    );
  }

  factory ShimmerWidget.button({
    required bool loading,
    double width = 80,
    double height = 36,
    double borderRadius = 8,
    Widget? child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return ShimmerWidget._(
      loading: loading,
      width: width,
      height: height,
      borderRadius: borderRadius,
      isCircle: false,
      duration: duration,
      child: child,
    );
  }

  factory ShimmerWidget.placeholder(
    Widget placeholder, {
    required bool loading,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return ShimmerWidget._(
      loading: loading,
      duration: duration,
      placeholder: placeholder,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.colors;

    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: loading
          ? Shimmer.fromColors(
              key: const ValueKey('shimmer'),
              baseColor: appColors.shimmerBaseColor, // Colors.grey.shade600,
              highlightColor:
                  appColors.shimmerHighlightColor, //  Colors.grey.shade500,
              child:
                  placeholder ??
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: appColors.shimmerBaseColor, //Colors.grey.shade600,
                      borderRadius: isCircle
                          ? null
                          : BorderRadius.circular(borderRadius),
                      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                    ),
                  ),
            )
          : (child != null
                ? KeyedSubtree(key: const ValueKey('child'), child: child!)
                : const SizedBox.shrink()),
    );
  }
}
