import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktoapp/app/themes/theme.dart';
import '../../../app/icons/icon.dart';

class NumberKeyboard extends StatelessWidget {
  final void Function(String) onKeyPressed;
  final VoidCallback? onDelete;
  final VoidCallback? onOk;
  final EdgeInsetsGeometry? margin;

  const NumberKeyboard({
    super.key,
    required this.onKeyPressed,
    this.onDelete,
    this.onOk,
    this.margin,
  });

  Widget _buildKey(BuildContext context, String text, {double height = 45}) {
    final color = context.colors;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: Material(
          color: color.keyboardSelectionColor,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () {
              if (text == 'backspace' || text == 'OK') {
                HapticFeedback.mediumImpact();
              } else {
                HapticFeedback.lightImpact();
              }
              if (text == 'backspace') {
                onDelete?.call();
              } else if (text == 'OK') {
                onOk?.call();
              } else {
                onKeyPressed(text);
              }
            },
            child: SizedBox(
              height: height,
              child: Center(
                child: text == 'backspace'
                    ? MyIcon.iconSystem(
                        "backspace.svg",
                        width: 24,
                        color: color.keyboardKeyColor,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                          color: color.keyboardKeyColor,
                          fontSize: 18,
                          fontWeight: text == 'OK'
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: context.colors.keyboardBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              for (int col = 0; col <= 9; col++) _buildKey(context, '$col'),
            ],
          ),
          Row(
            children: [
              _buildKey(context, '.'),
              _buildKey(context, 'backspace'),
              _buildKey(context, 'OK'),
            ],
          ),
          // OK 按钮
        ],
      ),
    );
  }
}
