import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../shared/widgets/triangle.dart';

class OutcomeView extends StatelessWidget {
  final String value;
  final bool? selected;
  final bool? up;
  final VoidCallback? onTap;

  const OutcomeView({
    super.key,
    required this.value,
    this.selected,
    this.up,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = context.colors;
    Color bgColor = appColor.selectionColor;
    Color textColor = appColor.onSelectionOddsColor;
    if (selected == true) {
      bgColor = appColor.onSelectionOddsColor;
      textColor = appColor.onSelectionOddsSelectedColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (up != null) TriangleIndicator(isUp: up!),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
