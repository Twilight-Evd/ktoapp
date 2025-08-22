import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'svg_assets_stub.dart' if (dart.library.io) 'assets/svg_assets.dart';

class MyIcon {
  static Widget _buildSvg(
    String path, {
    double? width,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    String? svgString;
    if (SvgAssets.all.isNotEmpty) {
      svgString = path.endsWith(".svg")
          ? SvgAssets.all[path.substring(0, path.length - 4)]
          : SvgAssets.all[path];
    }
    if (svgString != null) {
      return SvgPicture.string(
        svgString,
        key: key,
        width: width,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
        semanticsLabel: semanticLabel,
      );
    } else {
      // 从 assets 加载
      return SvgPicture.asset(
        'assets/images/$path',
        key: key,
        width: width,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
        semanticsLabel: semanticLabel,
      );
    }
  }

  static Widget menuIcon(
    String name, {
    double width = 32,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      "menu/$name",
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }

  static Widget icon(
    String name, {
    double? width = 28,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      name,
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }

  static Widget iconBank(
    String name, {
    double? width,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      "banks/$name",
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }

  static Widget iconFlagSquare(
    String name, {
    double? width = 14,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      "flags_svg/$name",
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }

  static Widget iconFlag(
    String name, {
    double? width = 20,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Key? key,
  }) {
    return Image.asset(
      "assets/images/flags/$name",
      width: width,
      height: width,
      color: color,
      fit: fit,
      key: key,
    );
  }

  static Widget iconSport(
    String name, {
    double? width = 28,
    Color? color = Colors.white,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      "sports/$name",
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }

  static Widget iconSystem(
    String name, {
    double? width = 28,
    Color? color = Colors.white,
    BoxFit fit = BoxFit.contain,
    Key? key,
    String? semanticLabel,
  }) {
    return _buildSvg(
      "system/$name",
      width: width,
      color: color,
      fit: fit,
      key: key,
      semanticLabel: semanticLabel,
    );
  }
}
