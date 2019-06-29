import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///常用tools
class CommonUilt {
  ///吐司
  static shoToast(@required String msg,
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

}
