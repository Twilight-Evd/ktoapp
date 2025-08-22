import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenHelper {
  static double screenPaddingTop(BuildContext context) {
    if (Platform.isAndroid) {
      ViewPadding padding = View.of(context).padding;
      if (padding.bottom == 0 && padding.top > 0) {
        return padding.top / View.of(context).devicePixelRatio;
      }
    }
    return 0;
  }

  static double navigationPaddingBottom(BuildContext context) {
    double pdbottom = View.of(context).padding.bottom;
    if (pdbottom > 0) {
      return pdbottom / View.of(context).devicePixelRatio;
    }
    return 0;
  }

  static double stateBarHeight(BuildContext context) {
    double pdTop = View.of(context).padding.top;
    if (pdTop > 0) {
      return pdTop / View.of(context).devicePixelRatio;
    }
    return 0;
  }

  static double navigationBarHeight(BuildContext context) {
    double barHeight = kBottomNavigationBarHeight;
    double pdbottom = navigationPaddingBottom(context);
    if (pdbottom > 0) {
      barHeight += pdbottom / 2;
    }
    return barHeight;
  }

  static double contentPaddingBarHeight(BuildContext context) {
    return navigationBarHeight(context) - 10;
  }

  static Size getScreenSize(BuildContext context) {
    final screenSize = View.of(context).physicalSize;
    final ratio = View.of(context).devicePixelRatio;
    return Size(screenSize.width / ratio, screenSize.height / ratio);
  }

  static Size getScreenSizeWithBuild(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
