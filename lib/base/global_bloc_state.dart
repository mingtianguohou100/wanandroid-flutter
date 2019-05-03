import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';

/*
* APP全局单利状态类
* **/

class GlobalBlocState {
  static GlobalBlocState _instance;
  static UserLocation _global_ul;

  get global_ul => _global_ul;

  void setGlobal_ul(UserLocation value) {
    _global_ul = value;
  }

  static GlobalBlocState get instance => _getInstance();

  factory GlobalBlocState() => _getInstance();

  static GlobalBlocState _getInstance() {
    if (_instance == null) {
      _instance = GlobalBlocState._internal();
    }
    return _instance;
  }

  GlobalBlocState._internal() {
    // 初始化
  }

/*
* 主题
* **/
  final List<Color> themeList = [
    Colors.black,
    Colors.red,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.lightBlue,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];
}
