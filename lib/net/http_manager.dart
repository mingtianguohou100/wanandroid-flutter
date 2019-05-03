import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';
import 'package:wanandroid_flutter/widget/network_loading_widget.dart';

class HttpManager {
  static const String GET_TYPE = "get";
  static const String POST_TYPE = "post";
  static HttpManager _instance;

  static HttpManager get instance => _getInstance();

  HttpManager._internal() {}

  factory HttpManager() => _getInstance();

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = HttpManager._internal();
    }
    return _instance;
  }

  void requestGet(String url, Function onSuccess,
      {Function onErro,
      dynamic params,
      dynamic headers,
      bool isLogin,
      BuildContext context}) async {

    _requestData(url, GET_TYPE, onSuccess,
        onErro: onErro,
        params: params,
        headers: headers,
        isLogin: isLogin,
        context: context);
  }

  void requestPost(String url, Function onSuccess,
      {Function onErro,
      dynamic params,
      dynamic headers,
      bool isLogin,
      BuildContext context}) async {

    _requestData(url, POST_TYPE, onSuccess,
        onErro: onErro,
        params: params,
        headers: headers,
        isLogin: isLogin,
        context: context);
  }

  void _requestData(String url, String method, Function onSuccess,
      {Function onErro,
      dynamic params,
      dynamic headers,
      bool isLogin,
      BuildContext context}) async {

    Options option = Options(
        baseUrl: Api.BASE_URL,
        method: method,
        connectTimeout: 5000,
        receiveTimeout: 3000); //链接超时5秒，接收超时3秒

    if (headers != null && headers.isNotEmpty) {
      option.headers = headers;
    }
    Response response;

    UserLocation ul = GlobalBlocState.instance.global_ul;
    if (ul != null && ul.cookie != null) {
      option.headers['Cookie'] = ul.cookie;
    }

    try {
      if (params != null && params.isNotEmpty) {
        response = await Dio().request(url, data: params, options: option);
      } else {
        response = await Dio().request(url, options: option);
      }
    } catch (e) {
      onErro("网络错误，亲!" + e.toString());
    }

    try {
      if (response.statusCode == 200) {
        int errorCode = response.data["errorCode"];
        String errorMsg = response.data["errorMsg"];
        if (errorCode == 0) {
          if (response.data != null) {
            print(
                "wanandroid_toke" + response.headers['set-cookie'].toString());
            if (url.contains(Api.LOGIN_URL)) {
              onSuccess(
                  response.data, response.headers['set-cookie'].toString());
            } else {
              onSuccess(response.data);
            }
          } else {
            onErro("空数据");
          }
        } else {
          onErro(errorMsg.isNotEmpty ? errorMsg : "服务器错误!");
        }
      } else {
        onErro("网络出问题拉!");
      }
    } catch (e) {
      onErro("网络错误!" + e.toString());
    }

  }

  void createInterceptor(Dio dio) {
    dio.interceptor.request.onSend = (Options options) {
      // 在请求被发送之前做一些事情
      print("createInterceptor:" + options.method);
    };

    dio.interceptor.response.onSuccess = (Response response) {
      // 在返回响应数据之前做一些预处理
      return response; // continue
    };

    dio.interceptor.response.onError = (DioError e) {
      // 当请求失败时做一些预处理
      print("createInterceptor:" + e.message);
      return e; //continue
    };
  }
}
