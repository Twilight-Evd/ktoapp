import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_shapes.dart';

class AppTheme {
  static final baseLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xFF00C853),
    cardColor: const Color(0xFFFFFFFF),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
      iconTheme: IconThemeData(color: Colors.black),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: Colors.black54,
      unselectedLabelColor: Colors.black54,
      labelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 14),
      indicator: BoxDecoration(
        color: Color(0xFFFFD600),
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
    ),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF00C853),
      secondary: Color(0xFFFFD600),
      surface: Color(0xFFF5F5F5),
      secondaryContainer: Color.fromARGB(255, 228, 228, 228),
      onPrimary: Colors.white,
      onSecondary: Colors.black54,
      // onSecondaryContainer:
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff00dd70),
        foregroundColor: Colors.white,
        disabledBackgroundColor: Color(0xffe1e1e1),
        disabledForegroundColor: Color(0xffbdbdbd),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black54,
        side: const BorderSide(color: Colors.black54, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    dividerColor: Colors.grey.shade300,
    extensions: <ThemeExtension>[
      AppColors.light(),
      AppSpacing.normal(),
      AppShapes.normal(),
    ],
    fontFamily: "Inter",
  );

  static final baseDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF000000),
    primaryColor: const Color(0xFF00C853),
    cardColor: const Color(0xff1e1e1e),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF000000),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF000000),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Colors.white60,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 14),
      indicator: BoxDecoration(
        color: Color(0xff5a5a5a),
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00C853),
      secondary: Color(0xff323232),
      secondaryContainer: Color(0xff1c1c1c),
      surface: Color(0xFF353333),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      outline: Colors.white54,
      onSurface: Colors.white54,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff00dd70),
        foregroundColor: Colors.black,
        disabledBackgroundColor: Color(0xffe1e1e1),
        disabledForegroundColor: Color(0xffbdbdbd),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    dividerColor: Color(0x1FFFFFFF),
    extensions: <ThemeExtension>[
      AppColors.dark(),
      AppSpacing.normal(),
      AppShapes.normal(),
    ],
    fontFamily: "Inter",
  );
}
