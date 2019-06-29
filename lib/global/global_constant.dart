import 'dart:ui';

import 'package:flutter/material.dart';

/*
* APP全局常量
* **/

class GlobalConstant {
  ///本地用户信息key
  static const String LOCAL_USER_DATA_KEY="wad_flutter_userdata_key";
  ///本地主题key
  static const String LOCAL_INTEMATIONALIZATION_KEY="wad_flutter_internationalization_key";
  ///本地国际化key
  static const String LOCAL_THEME_KEY="wad_flutter_theme_key";


  //国际化
  static const String CHINESE = "zh";
  static const String ENGLISH = "en";

//主题
  static const List<Color> themeList = [
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
