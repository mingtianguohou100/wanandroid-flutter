import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/state.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';

class SideslipState implements Cloneable<SideslipState> {

  Locale locale;


  int themeColor;


  UserLoginBean userLoginBean;

  @override
  SideslipState clone() {
    return SideslipState()
      ..locale = locale
      ..themeColor = themeColor
      ..userLoginBean = userLoginBean;
  }


}

SideslipState initState(Map<String, dynamic> args) {
  return SideslipState();
}
