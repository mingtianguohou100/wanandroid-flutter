import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wandroid_flutter/global/global_fish_redux/state.dart';

class AppState implements GlobalBaseState<AppState> {
  @override
  int themeColor;

  @override
  String token;

  @override
  Locale locale;

  @override
  AppState clone() {
    return AppState()
      ..themeColor = themeColor
      ..locale = locale
      ..token = token;
  }
}

AppState initState(Map<String, dynamic> args) {
  return AppState();
}
