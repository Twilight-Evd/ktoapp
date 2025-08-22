import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../../app/icons/icon.dart';
import '../../../../shared/widgets/divider.dart';

class BetslipTips extends StatelessWidget {
  final String message;

  const BetslipTips({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyIcon.iconSystem(
                "close.svg",
                color: colorScheme.onSurface,
                width: 24,
              ),
            ),
          ),
          AutoDivider.vertical(width: 0.5, thickness: 2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8.0,
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 12),
                softWrap: true,
              ),
            ),
          ),
          AutoDivider.vertical(
            width: 5,
            thickness: 5,
            color: Color(0xfffad749),
          ),
        ],
      ),
    );
  }
}
