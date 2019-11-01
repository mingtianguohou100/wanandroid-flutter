import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  int get themeColor;

  UserLoginBean get userLoginBean;

  set userLoginBean(UserLoginBean userLoginBean);

  Locale get locale;

  set locale(Locale locale);

  set themeColor(int themeColor);
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  int themeColor;

  @override
  Locale locale;

  @override
  UserLoginBean userLoginBean;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..locale = locale
      ..userLoginBean = userLoginBean;
  }
}
