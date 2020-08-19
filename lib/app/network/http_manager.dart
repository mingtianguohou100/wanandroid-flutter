import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:wandroid_flutter/app/global_fish_redux/action.dart';
import 'package:wandroid_flutter/app/global_fish_redux/store.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'package:wandroid_flutter/utils/common_util.dart';
import 'package:wandroid_flutter/utils/toast_util.dart';
import 'dart:convert' as convert;

import 'api.dart';

class HttpManager {
  static HttpManager _instance;

  static HttpManager get instance => HttpManager._internal();

  factory HttpManager() => _instance;

  HttpManager._internal();

  Future requestNetWork(
    String url, {
    BuildContext context,
    Map<String, dynamic> queryParameters,
    method = Api.GET_TYPE,
  }) async {
    //判断是否有网络
    bool connectivityResult =await CommonUilt.checkNetWorkState();
    if (!connectivityResult) {
      if (context != null)
        ToastUtil.shoToast(S.of(context).global_no_network,
            backgroundColor: Colors.red);
      return Future.error(S.of(context).global_no_network);
    } else {
      Response response;
      switch (method) {
        case Api.GET_TYPE:
          response = await http.get(Api.BASE_URL +
              url +
              CommonUilt.mapParamsToUrl(queryParameters));
          break;
        case Api.POST_TYPE:
          response =
          await http.post(Api.BASE_URL + url, body: queryParameters);
          break;
      }

      if (response != null) {
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          if (jsonResponse != null) {
            String cookie = response.headers["set-cookie"];
            if (cookie != null) {
              GlobalStore.store
                  .dispatch(GlobalActionCreator.changeUserData(cookie));
            }
            int errorCode = jsonResponse["errorCode"];
            String errorMsg = jsonResponse["errorMsg"];
            if (errorCode == Api.SUCCESS_CODE) {
              return jsonResponse["data"];
            } else {
              errorMsg = errorMsg != null ? errorMsg : "";
              ToastUtil.shoToast(errorMsg, backgroundColor: Colors.red);
              return Future.error(errorMsg);
            }
          } else {
            ToastUtil.shoToast("JSON错误!", backgroundColor: Colors.red);
            return Future.error("JSON错误!");
          }
        } else {
          ToastUtil.shoToast("接口错误:${response.statusCode}",
              backgroundColor: Colors.red);
          return Future.error("接口错误:${response.statusCode}");
        }
      } else {
        ToastUtil.shoToast("网络请求失败!", backgroundColor: Colors.red);
        return Future.error("网络请求失败!");
      }
    }
  }



}
