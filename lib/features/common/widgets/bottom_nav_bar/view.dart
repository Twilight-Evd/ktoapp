import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../../app/langs/strings.g.dart';
import '../../../../app/icons/icon.dart';
import '../../../../core/utils/screen_helper.dart';
import 'model.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomItem> items;
  final Function? onTap;
  final int index;
  const BottomNavBar({
    super.key,
    required this.items,
    this.onTap,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    final pb = ScreenHelper.navigationPaddingBottom(context);
    final size = ScreenHelper.getScreenSize(context);
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: pb > 0 ? pb / 2 : 5, left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return SizedBox(
            width: (size.width - 12) / 6,
            child: BottomNavBarItem(
              icon: item.icon,
              label: item.label != null ? t.bottomNav[item.name] : item.label,
              selected: this.index == index,
              onTap: () {
                if (this.index != index) {
                  onTap?.call(index);
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final String icon;
  final String? label;
  final bool selected;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.icon,
    this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.bottomNavigationBarTheme;

    final bool hasLabel = label != null && label!.isNotEmpty;
    final iconWidget = hasLabel
        ? MyIcon.menuIcon(
            icon,
            width: 32,
            color: selected
                ? theme.selectedItemColor
                : theme.unselectedItemColor,
          )
        : MyIcon.menuIcon(icon, width: 68);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          if (hasLabel) ...[
            Text(
              label!,
              style: selected
                  ? theme.selectedLabelStyle
                  : theme.unselectedLabelStyle,
            ),

            const SizedBox(height: 4),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 3,
              width: 20,
              color: selected ? const Color(0xffda0000) : Colors.transparent,
            ),
          ],
        ],
      ),
    );
  }
}
