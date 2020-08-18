import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wandroid_flutter/widget/low_poly_wolf_controller.dart';

class SideslipState implements Cloneable<SideslipState> {
  Locale locale;

  int themeColor;

  String token;

  Color lpwColor;
  String lpwString;
  int colorIndex;
  bool lpwAnimaIsCom;
  LowPolyWolfController lowPolyWolfController;

  @override
  SideslipState clone() {
    return SideslipState()
      ..locale = locale
      ..lpwColor = lpwColor
      ..lpwString = lpwString
      ..colorIndex = colorIndex
      ..lowPolyWolfController = lowPolyWolfController
      ..lpwAnimaIsCom = lpwAnimaIsCom
      ..themeColor = themeColor
      ..token = token;
  }
}

SideslipState initState(Map<String, dynamic> args) {
  return SideslipState();
}
