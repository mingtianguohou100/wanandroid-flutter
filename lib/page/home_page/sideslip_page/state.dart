import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/state.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/widget/low_poly_wolf_controller.dart';

class SideslipState implements Cloneable<SideslipState> {
  Locale locale;

  int themeColor;

  UserLoginBean userLoginBean;

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
      ..userLoginBean = userLoginBean;
  }
}

SideslipState initState(Map<String, dynamic> args) {
  return SideslipState();
}
