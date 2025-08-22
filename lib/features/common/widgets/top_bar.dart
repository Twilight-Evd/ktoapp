import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';
import 'package:provider/provider.dart';

import '../../../app/app_state.dart';
import '../../../app/icons/icon.dart';

class TopBar extends StatelessWidget {
  final bool? hidePromotionBtn;
  const TopBar({super.key, this.hidePromotionBtn});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appBarTheme;
    final loggedIn = context.select<AppState, bool>((state) => state.loggedIn);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: MyIcon.iconSystem("menu.svg", color: theme.iconTheme?.color),
          ),
          Expanded(child: MyIcon.icon("logo.svg", width: 70)),
          if (loggedIn)
            GestureDetector(
              onTap: () => context.read<AppState>().logout(),
              child: MyIcon.iconSystem(
                "user.svg",
                color: theme.iconTheme?.color,
              ),
            ),
          Visibility(
            visible: hidePromotionBtn == null || hidePromotionBtn == false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: MyIcon.icon(
                "ic_promotions.svg",
                color: theme.iconTheme?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
