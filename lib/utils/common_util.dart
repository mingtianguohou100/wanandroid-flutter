import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///常用tools
class CommonUilt {
  ///吐司
  static shoToast(String msg,
      {Toast toastLength = Toast.LENGTH_SHORT,
      double fontSize = 16.0,
      Color backgroundColor = Colors.black,
      Color textColor = Colors.white,
      ToastGravity gravity = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIos: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  ///配置默认snackbar
  static SnackBar showSnackBar(@required Widget widget,
      {Duration duration = const Duration(milliseconds: 1000),
      Color backgroundColor = Colors.black}) {
    return SnackBar(
      backgroundColor: backgroundColor,
      content: widget,
      duration: duration,
    );
  }

  ///将map转为拼接成url键值对
  static String mapParamsToUrl(Map<String, String> params) {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      return paramStr;
    }
    return "";
  }
}
