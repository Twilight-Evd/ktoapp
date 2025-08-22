import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

class AutoDivider extends StatelessWidget {
  final Axis direction;
  final double mainAxisLength;
  final double thickness;
  final Color? color;
  final double indent;
  final double endIndent;

  const AutoDivider._({
    super.key,
    required this.direction,
    required this.mainAxisLength,
    required this.thickness,
    required this.color,
    required this.indent,
    required this.endIndent,
  });

  factory AutoDivider.vertical({
    double width = 20.0,
    double thickness = 1.0,
    Color? color,
    double indent = 0.0,
    double endIndent = 0.0,
    Key? key,
  }) {
    return AutoDivider._(
      key: key,
      direction: Axis.vertical,
      mainAxisLength: width,
      thickness: thickness,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }

  factory AutoDivider.horizontal({
    double height = 16.0,
    double thickness = 1.0,
    Color? color,
    double indent = 0.0,
    double endIndent = 0.0,
    Key? key,
  }) {
    return AutoDivider._(
      key: key,
      direction: Axis.horizontal,
      mainAxisLength: height,
      thickness: thickness,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.vertical) {
      return Container(
        width: mainAxisLength,
        padding: EdgeInsets.only(top: indent, bottom: endIndent),
        alignment: Alignment.center,
        child: Container(
          width: thickness,
          color: color ?? context.theme.dividerColor,
        ),
      );
    } else {
      return Container(
        height: mainAxisLength,
        padding: EdgeInsets.only(left: indent, right: endIndent),
        alignment: Alignment.center,
        child: Container(
          height: thickness,
          color: color ?? context.theme.dividerColor,
        ),
      );
    }
  }
}
