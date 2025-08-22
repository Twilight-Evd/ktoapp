import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  final Axis direction;
  final Widget? iconWidget;
  final String? text;
  final TextStyle? textStyle;
  final Widget? labelWidget;
  final EdgeInsetsGeometry? padding;
  final double? space;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? reversed;

  const IconWithLabel({
    super.key,
    this.direction = Axis.horizontal,
    this.text,
    this.textStyle,
    this.padding,
    this.iconWidget,
    this.labelWidget,
    this.space,
    this.mainAxisAlignment,
    this.reversed,
  });

  @override
  Widget build(BuildContext context) {
    Widget? label;
    if (labelWidget != null) {
      label = Flexible(child: labelWidget!);
    } else if (text != null) {
      label = Flexible(child: Text(text!, style: textStyle));
    }
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Flex(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: (() {
          var children = [
            if (iconWidget != null) ...[
              iconWidget!,
              SizedBox(width: space ?? 5, height: space ?? 5),
            ],
            ?label,
          ];
          return reversed == true ? children.reversed.toList() : children;
        })(),
      ),
    );
  }
}
