import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/state.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';

class AppState implements GlobalBaseState<AppState> {
  @override
  int themeColor;

  @override
  UserLoginBean userLoginBean;

  @override
  Locale locale;

  @override
  AppState clone() {
    return AppState()
      ..themeColor = themeColor
      ..locale = locale
      ..userLoginBean = userLoginBean;
  }
}

AppState initState(Map<String, dynamic> args) {
  return AppState();
}
