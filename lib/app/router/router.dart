import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/common/bloc/menu/menu_cubit.dart';
import '../../features/common/models/match_model.dart';
import '../../features/login/view/login_page.dart';
import '../../features/splash/view/splash_page.dart';
import '../../features/sports/view/detail_page.dart';
import '../../shared/widgets/custom_transition_page.dart';
import '../app_state.dart';
import '../config/global_key.dart';
import '../layout/layout.dart';
import 'config.dart';

GoRouter createRouter(AppState appState) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/splash",
    refreshListenable: Listenable.merge([appState]),
    redirect: (context, state) {
      final initialized = appState.initialized;
      // final loggedIn = appState.loggedIn;
      final loc = state.fullPath;

      if (!initialized) {
        return loc == '/splash' ? null : '/splash';
      }
      // if (!loggedIn) {
      //   return loc == '/login' ? null : '/login';
      // }
      if (loc == '/splash' || loc == '/login') return '/sports';
      return null;
    },
    routes: [
      GoRoute(
        name: "splash",
        path: "/splash",
        pageBuilder: (context, state) {
          return myTransitionPage(SplashWrapper(), state: state);
        },
      ),
      GoRoute(
        name: "login",
        path: "/login",
        pageBuilder: (context, state) {
          return myTransitionPage(LoginPage(), state: state);
        },
      ),
      GoRoute(
        name: "detail",
        path: "/detail",
        pageBuilder: (context, state) {
          return myTransitionPage(
            DetailPage(matchModel: state.extra as MatchModel),
            state: state,
            type: PageTransitionType.blurZoom,
          );
        },
      ),
      ...bottomItems.entries.map((entry) {
        final layoutType = entry.key;
        final items = entry.value;
        return StatefulShellRoute.indexedStack(
          pageBuilder: (context, state, navigationShell) {
            return myTransitionPage(
              BlocProvider(
                create: (_) => MenuCubit(navigationShell.currentIndex),
                child: Layout(
                  key: Key("${layoutType}_layout"),
                  layoutType: layoutType,
                  child: navigationShell,
                ),
              ),
              state: state,
            );
          },
          branches: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return StatefulShellBranch(routes: [item.toGoRoute(index)]);
          }).toList(),
        );
      }),
    ],
  );
}
