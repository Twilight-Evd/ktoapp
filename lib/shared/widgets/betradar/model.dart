import 'dart:convert';

import 'package:flutter/material.dart';

import 'html.dart';
import 'widget.dart';

class Betradar {
  static Betradar? _instance;

  final String htmlData;
  final String referDomain;

  Betradar({required this.htmlData, required this.referDomain});

  static Betradar getInstance({
    required String betraderClientID,
    required BetradarSetting setting,
    required String referDomain,
    List<String>? css,
  }) {
    String cssElements = "";
    if (css != null) {
      cssElements = css
          .map((l) => '<link rel="stylesheet" type="text/css" href="$l">')
          .toList()
          .join("\n");
    }

    _instance ??= Betradar(
      htmlData: betradarHTML
          .replaceAll("{{styles}}", cssElements)
          .replaceAll("{{clientID}}", betraderClientID)
          .replaceAll("{{setting}}", setting.toJsonStr()),
      referDomain: referDomain,
    );

    return _instance!;
  }

  static Betradar? get instance => _instance;

  static void reset() {
    _instance = null;
  }

  Widget render(int matchId, {Brightness? brightness}) {
    String themeData = "";
    if (brightness == Brightness.light) {
      themeData = '''
      .sr-bb { background: #F5F5F5;}
      .sr-bb .srt-base-1 {color: #0000008A;}
      ''';
    }
    return BetradarWidget(
      matchId: matchId,
      htmlData: htmlData
          .replaceAll("{{matchId}}", '$matchId')
          .replaceAll("{{theme}}", themeData),
      referDomain: referDomain,
    );
  }
}

class BetradarSetting {
  final String detailedScoreboard;
  final String tabsPosition;
  final String layout;
  final String pitchCustomBgColor;
  final List<String> logo;
  final String pitchLogo;
  final List<String> goalBannerImage;
  final String goalBannerCustomBgColor;
  final bool forceTeamInvert;
  final bool showScoreboard;

  const BetradarSetting({
    required this.detailedScoreboard,
    required this.tabsPosition,
    required this.layout,
    required this.pitchCustomBgColor,
    required this.logo,
    required this.pitchLogo,
    required this.goalBannerImage,
    required this.goalBannerCustomBgColor,
    this.forceTeamInvert = false,
    this.showScoreboard = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'detailedScoreboard': detailedScoreboard,
      'tabsPosition': tabsPosition,
      'layout': layout,
      'pitchCustomBgColor': pitchCustomBgColor,
      'logo': logo,
      'pitchLogo': pitchLogo,
      'goalBannerImage': goalBannerImage,
      'goalBannerCustomBgColor': goalBannerCustomBgColor,
      'forceTeamInvert': forceTeamInvert,
      'showScoreboard': showScoreboard,
    };
  }

  String toJsonStr() {
    return jsonEncode(toJson());
  }
}
