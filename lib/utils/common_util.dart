import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wandroid_flutter/generated/i18n.dart';

///常用tools
class CommonUilt {

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

  ///检查网络状态
  ///state true:判断是否有网络
  ///      false：判断是否是wifi
  static Future<bool> checkNetWorkState({bool state = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (state) {
      if (connectivityResult != ConnectivityResult.none) {
        return true;
      } else {
        return false;
      }
    } else {
      if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    }
  }




}
