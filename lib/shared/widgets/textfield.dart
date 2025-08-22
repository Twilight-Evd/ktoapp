import 'dart:ui';

import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  final Function? validator;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final TextStyle? style;
  final FocusNode? focusNode;
  final Function? onSubmitted;
  final Radius? radius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;
  final bool? showCursor;
  final bool readOnly;
  final String? hintText;
  final Widget Function(String? errorText)? errorWidget;
  final void Function(String)? onChanged;
  final GestureTapCallback? onTap;

  const CustomFormTextField({
    super.key,
    this.validator,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.style,
    this.focusNode,
    this.onSubmitted,
    this.radius,
    this.fillColor,
    this.borderColor,
    this.cursorColor,
    this.readOnly = false,
    this.errorWidget,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.showCursor,
  });

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
    borderRadius: BorderRadius.all(widget.radius ?? Radius.circular(4)),
  );

  OutlineInputBorder copyWithColor(Color color) {
    return outlineInputBorder.copyWith(
      borderSide: outlineInputBorder.borderSide.copyWith(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    return FormField<String>(
      validator: (value) {
        return widget.validator?.call(value);
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onTap: widget.onTap,
              enableInteractiveSelection: false,
              contextMenuBuilder: (context, editableTextState) {
                return const SizedBox.shrink();
              },
              onSubmitted: (value) {
                widget.onSubmitted?.call(value);
              },
              readOnly: widget.readOnly,
              keyboardAppearance: Brightness.dark,
              minLines: widget.minLines,
              textInputAction: TextInputAction.done,
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: (value) {
                field.didChange(value);
                field.validate();
                widget.onChanged?.call(value);
              },
              style: widget.style?.copyWith(height: 1.4),
              strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.1),
              selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
              selectionWidthStyle: BoxWidthStyle.max,
              maxLines: widget.maxLines,
              showCursor: widget.showCursor,
              cursorHeight: 20,
              cursorColor: widget.cursorColor ?? colorScheme.primary,
              cursorErrorColor: colorScheme.primary,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 12),
                contentPadding: EdgeInsets.all(2),
                isDense: true,
                filled: true,
                fillColor: widget.fillColor ?? inputDecorationTheme.fillColor,
                enabledBorder: copyWithColor(
                  field.hasError
                      ? colorScheme
                            .error // colorScheme.error
                      : widget.borderColor ?? colorScheme.onSurface,
                ),
                focusedBorder: copyWithColor(
                  field.hasError
                      ? colorScheme
                            .error // colorScheme.error
                      : widget.borderColor ?? colorScheme.onSurface,
                ),
                errorBorder: copyWithColor(colorScheme.error),
                focusedErrorBorder: copyWithColor(colorScheme.error),
              ),
            ),
            if (field.hasError && widget.errorWidget != null) ...[
              SizedBox(height: 5.0),

              widget.errorWidget!.call(field.errorText),
              // IconWithLabel(
              //   iconWidget: Img.image(
              //     "info.png",
              //     size: Size(14, 14),
              //     color: colorScheme.error,
              //   ),
              //   text: field.errorText ?? 'Required!',
              //   textStyle: Theme.of(
              //     context,
              //   ).textTheme.labelSmall!.copyWith(color: colorScheme.error),
              // ),
            ],
          ],
        );
      },
    );
  }
}
