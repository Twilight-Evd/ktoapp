import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/common/bloc/menu/menu_cubit.dart';
import '../../features/common/widgets/betslip/wrapper.dart';
import '../../features/common/widgets/bottom_nav_bar/export.dart';
import '../../features/common/widgets/drawar/drawer.dart';
import '../../features/common/widgets/login_bar.dart';
import '../../features/common/widgets/settings_fab.dart';
import '../../features/common/widgets/top_bar.dart';
import '../../shared/constants/enum.dart';
import '../router/config.dart';

class Layout extends StatelessWidget {
  final StatefulNavigationShell child;
  final LayoutType layoutType;

  const Layout({
    super.key,
    required this.child,
    this.layoutType = LayoutType.platform,
  });

  void _onTap(BuildContext context, int index) {
    if (index == child.currentIndex) return;
    context.read<MenuCubit>().setIndex(index);
    child.goBranch(index, initialLocation: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(key: UniqueKey()),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              key: Key("topBar_$layoutType"),
              hidePromotionBtn: layoutType == LayoutType.sportsbook,
            ),
            const LoginBar(),
            Expanded(child: child),
            BetslipWrapper(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        key: Key("bottom_$layoutType"),
        items: bottomItems[layoutType]!,
        index: child.currentIndex,
        onTap: (i) => _onTap(context, i),
      ),
      floatingActionButton: SettingsFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
