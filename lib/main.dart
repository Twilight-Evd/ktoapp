import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/app.dart';
import 'app/app_state.dart';
import 'core/utils/log.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      final appState = AppState();
      await appState.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      appState.initializeApp();
      // Bloc.observer = SimpleBlocObserver();
      runApp(MyApp(appState: appState));
    },
    (exception, stackTrace) async {
      logger.e("$exception,$stackTrace");
    },
  );
}
