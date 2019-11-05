import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  int get themeColor;

  String get token;

  set token(String token);

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
  String  token;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..locale = locale
      ..token = token;
  }
}
