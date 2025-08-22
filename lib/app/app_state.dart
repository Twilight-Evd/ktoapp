import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ktoapp/core/services/storage.dart';
import 'langs/strings.g.dart';

class AppState extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  ThemeMode _themeMode = ThemeMode.system;
  AppLocale? _appLocale;

  bool get initialized => _initialized;
  bool get loggedIn => _loggedIn;
  ThemeMode get themeMode => _themeMode;
  AppLocale? get appLocal => _appLocale;

  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale';

  final Storage storage = Storage();

  Future<void> ensureInitialized() async {
    final themeString = await storage.read(_themeKey);
    _themeMode = ThemeMode.system;
    if (themeString != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeString,
        orElse: () => ThemeMode.system,
      );
    }

    final localeString = await storage.read(_localeKey);
    AppLocale? appLocale;
    if (localeString != null) {
      appLocale = AppLocale.values
          .where((e) => e.languageTag == localeString)
          .firstOrNull;
    }
    if (appLocale != null) {
      _appLocale = await LocaleSettings.setLocale(appLocale);
    } else {
      _appLocale = await LocaleSettings.useDeviceLocale();
    }

    Intl.defaultLocale = _appLocale?.languageCode;
  }

  void initializeApp() async {
    await Future.delayed(Duration(seconds: 1));
    _initialized = true;
    _loggedIn = true;
    notifyListeners();
  }

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    storage.write(_themeKey, themeMode.toString());
    notifyListeners();
  }

  Future<void> setLocale(AppLocale appLocale) async {
    _appLocale = await LocaleSettings.setLocale(appLocale);
    Intl.defaultLocale = _appLocale?.languageCode;
    storage.write(_localeKey, appLocale.languageTag);
    notifyListeners();
  }
}
