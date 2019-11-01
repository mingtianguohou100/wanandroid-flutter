import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalThemeStyle {
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

  ///标题字号
  static double titleFontSize = ScreenUtil().setSp(33.0);

  ///普通字号
  static double normalFontSize = ScreenUtil().setSp(30.0);

  ///自定义
  static Color colorFromValue(int value) {
    return Color(value);
  }

  static double fontFromPx(double px) {
    return ScreenUtil().setSp(px);
  }

  static double widthFromPx(double px) {
    return ScreenUtil().setWidth(px);
  }

  static double heightFromPx(double px) {
    return ScreenUtil().setHeight(px);
  }
}
