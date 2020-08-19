import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
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
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  ///snackbar
  static SnackBar showSnackBar(Widget widget,
      {Duration duration = const Duration(milliseconds: 1000),
      Color backgroundColor = Colors.black}) {
    return SnackBar(
      backgroundColor: backgroundColor,
      content: widget,
      duration: duration,
    );
  }



}
