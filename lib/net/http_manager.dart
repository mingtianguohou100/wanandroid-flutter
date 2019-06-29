import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

import 'interceptors/cache_interceptors.dart';
import 'interceptors/error_interceptors.dart';
import 'interceptors/log_interceptors.dart';

class HttpManager {
  static HttpManager _instance;

  static HttpManager get instance => HttpManager._internal();

  factory HttpManager() => _instance;

  Dio _dio;

  HttpManager._internal() {
    _dio = Dio();
    _dio.options.connectTimeout = Api.CONNECT_TIMEOUT;
    _dio.options.receiveTimeout = Api.RECEIVE_TIMEOUT;

    _dio.interceptors.add(ErrorInterceptors(_dio));
    _dio.interceptors.add(LogInterceptors());
    _dio.interceptors.add(CachceInterceptors());
//    _dio.interceptors.add(TokenInterceptors());
  }

  Future requestNetWork(
    String url, {
    Map<String, dynamic> queryParameters,
    method = Api.GET_TYPE,
  }) async {
    _dio.options.method = method;

    UserLoginBean _userLoginBean = await SpUtils.getUserInfo();

    if (_userLoginBean != null && _userLoginBean.token != null) {
      _dio.options.headers = {"token": _userLoginBean.token.toString()};
    }

    Response response = null;
    try {
      response = await _dio.request(Api.BASE_URL + url,
          queryParameters: queryParameters);

      if (response != null) {
        int errorCode = response.data["errorCode"];
        String errorMsg = response.data["errorMsg"];
        if (errorCode == Api.SUCCESS_CODE) {
          return response.data["data"];
        } else {
          errorMsg = errorMsg != null ? errorMsg : "";
          CommonUilt.shoToast(errorMsg, backgroundColor: Colors.red);
          return Future.error(errorMsg);
        }
      }
    } catch (e) {
      return Future.error(e != null ? e : "");
    }

    return Future.error(response.statusMessage);
  }
}
