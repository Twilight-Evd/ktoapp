import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class MyAnimation {
  static Widget get loading {
    return Lottie.asset(
      "assets/images/lottie/pre_loader.json",
      width: 80,
      height: 80,
    );
  }

  static Animatable<double> get shakeAnimation {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -10.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -10.0,
          end: 5.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 5.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]);
  }
}
