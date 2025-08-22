import 'package:flutter/material.dart';

import '../../features/test/view/BtoAAnimationDemo.dart';
import '../../features/test/view/animated_page.dart';
import '../../features/test/view/intake_progress.dart';
import '../../shared/constants/enum.dart';
import '../../shared/widgets/custom_transition_page.dart';
import '../../features/home/view/home_page.dart';
import '../../features/sports/view/live_page.dart';
import '../../features/promotion/view/promotion_page.dart';
import '../../features/sports/view/sports_page.dart';
import '../../features/common/widgets/bottom_nav_bar/model.dart';

final Map<LayoutType, List<BottomItem>> bottomItems = {
  LayoutType.platform: [
    BottomItem.withView(
      name: "casino",
      path: "/casino",
      icon: "IconSlots_on.svg",
      label: "Cassino",
      viewBuilder: (context) => HomePage(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      name: "live_casino",
      path: "/live_casino",
      icon: "IconLiveCasino_on.svg",
      label: "Cassino Ao Vivo",
      viewBuilder: (context) => Placeholder(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      name: "crash_games",
      path: "/crash_games",
      icon: "IconCrashGames_on.svg",
      label: "Crash Games",
      viewBuilder: (context) => Placeholder(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      name: "promotions",
      path: "/promotions",
      icon: "IconPromotions_on.svg",
      label: "Promoções",
      viewBuilder: (context) => PromotionPage(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.redirect(
      name: "goto-esports",
      path: "/goto-esports",
      icon: "sports_context_change-1.svg",
      redirectPath: "/sports",
    ),
  ],

  LayoutType.sportsbook: [
    BottomItem.withView(
      icon: "IconPrematch_on.svg",
      label: "Esportes",
      path: "/sports",
      name: "sports",
      viewBuilder: (context) => EsportsPage(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      icon: "IconLive_on.svg",
      label: "Ao Vivo",
      path: "/live",
      name: "live",
      viewBuilder: (context) => LivePage(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      icon: "Icon_startingsoon.svg",
      label: "Em Breve",
      path: "/coming_soon",
      name: "coming_soon",
      viewBuilder: (context) => UserProfilePage(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      icon: "IconMybets_on.svg",
      label: "Apostas",
      path: "/betting",
      name: "betting",
      viewBuilder: (context) => WaterIntakeProgress(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.withView(
      icon: "IconSearchA-Z_on.svg",
      label: "Explorar",
      path: "/explore",
      name: "explore",
      viewBuilder: (context) => BtoAAnimationDemo(),
      pageBuilder: (child, state) => myTransitionPage(child, state: state),
    ),
    BottomItem.redirect(
      icon: "casino_context_change.svg",
      path: "/goto-index",
      name: "goto-index",
      redirectPath: "/casino",
    ),
  ],
};
