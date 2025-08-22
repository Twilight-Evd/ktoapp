import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../shared/widgets/animation.dart';

class SplashWrapper extends StatelessWidget {
  const SplashWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return Scaffold(
      backgroundColor:
          context.theme.scaffoldBackgroundColor, // Color(0xFF121212),
      body: Center(child: MyAnimation.loading),
    );
  }
}
