import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/services/network_manager.dart';
import '../features/common/bloc/sport/bloc.dart';
import 'app_state.dart';
import 'langs/strings.g.dart';
import 'life_cycle.dart';
import 'router/router.dart';
import 'themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final AppState appState;
  const MyApp({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final router = createRouter(appState);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => SportRepository(NetworkManager.instance),
        ),
        ChangeNotifierProvider.value(value: appState),
      ],
      child: AppLifeCycle(
        child: TranslationProvider(
          child: ProviderScope(
            child: Builder(
              builder: (context) {
                final state = context.select<AppState, (ThemeMode, AppLocale?)>(
                  (state) => (state.themeMode, state.appLocal),
                );
                return MaterialApp.router(
                  key: ValueKey(state.$2.toString()),
                  title: t.app.title,
                  locale: appState.appLocal?.flutterLocale,
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                  themeMode: state.$1,
                  theme: AppTheme.baseLightTheme,
                  darkTheme: AppTheme.baseDarkTheme,
                  builder: (context, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
