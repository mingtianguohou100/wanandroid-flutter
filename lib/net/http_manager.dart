import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'package:http/http.dart' as http;
import 'package:wanandroid_flutter/utils/sp_util.dart';
import '../generated/i18n.dart';
import '../model/UserLoginBean.dart';
import 'dart:convert' as convert;

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
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (context != null)
        CommonUilt.shoToast(S.of(context).global_no_network,
            backgroundColor: Colors.red);
      return Future.error(S.of(context).global_no_network);
    } else {
      Response response;
      UserLoginBean _userLoginBean = SpUtil.getUserInfo();
      String _token = _userLoginBean != null ? _userLoginBean.token : null;
      switch (method) {
        case Api.GET_TYPE:
          if (_token != null) {
            response = await http.get(
                Api.BASE_URL + url + CommonUilt.mapParamsToUrl(queryParameters),
                headers: {"token": _token});
          } else {
            response = await http.get(Api.BASE_URL +
                url +
                CommonUilt.mapParamsToUrl(queryParameters));
          }
          break;
        case Api.POST_TYPE:
          if (_token != null) {
            response = await http.post(Api.BASE_URL + url,
                body: queryParameters, headers: {"token": _token});
          } else {
            response =
                await http.post(Api.BASE_URL + url, body: queryParameters);
          }
          break;
      }

      if (response != null) {
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          if (jsonResponse != null) {
            int errorCode = jsonResponse["errorCode"];
            String errorMsg = jsonResponse["errorMsg"];
            if (errorCode == Api.SUCCESS_CODE) {
              return jsonResponse["data"];
            } else {
              errorMsg = errorMsg != null ? errorMsg : "";
              CommonUilt.shoToast(errorMsg, backgroundColor: Colors.red);
              return Future.error(errorMsg);
            }
          } else {
            CommonUilt.shoToast("JSON错误!", backgroundColor: Colors.red);
            return Future.error("JSON错误!");
          }
        } else {
          CommonUilt.shoToast("接口错误!", backgroundColor: Colors.red);
          return Future.error("接口错误!");
        }
      } else {
        CommonUilt.shoToast("网络请求失败!", backgroundColor: Colors.red);
        return Future.error("网络请求失败!");
      }
    }
//    if (response.statusCode == 200) {
//      var jsonResponse = convert.jsonDecode(response.body);
//      print("asdasfasf${jsonResponse}");
//      int errorCode = response.data["errorCode"];
//      String errorMsg = response.data["errorMsg"];
//      if (errorCode == Api.SUCCESS_CODE) {
//        return response.data["data"];
//      } else {
//        errorMsg = errorMsg != null ? errorMsg : "";
//        CommonUilt.shoToast(errorMsg, backgroundColor: Colors.red);
//        return Future.error(errorMsg);
//      }
//    } else {
//      return Future.error("");
//    }
//    UserLoginBean _userLoginBean = await SpUtils.getUserInfo();
//
//    if (_userLoginBean != null && _userLoginBean.token != null) {
//      _dio.options.headers = {"token": _userLoginBean.token.toString()};
//    }
//
//    try {
//      response = await _dio.request(Api.BASE_URL + url,
//          queryParameters: queryParameters);
//
//      if (response != null) {
//        int errorCode = response.data["errorCode"];
//        String errorMsg = response.data["errorMsg"];
//        if (errorCode == Api.SUCCESS_CODE) {
//          return response.data["data"];
//        } else {
//          errorMsg = errorMsg != null ? errorMsg : "";
//          CommonUilt.shoToast(errorMsg, backgroundColor: Colors.red);
//          return Future.error(errorMsg);
//        }
//      }
//    } catch (e) {
//      return Future.error(e != null ? e : "");
//    }
//    return Future.error(response.statusMessage);
  }

//  Future requestNetWork(
//    String url, {
//    Map<String, dynamic> queryParameters,
//    method = Api.GET_TYPE,
//  }) async {
//    _dio.options.method = method;
//
//    UserLoginBean _userLoginBean = await SpUtils.getUserInfo();
//
//    if (_userLoginBean != null && _userLoginBean.token != null) {
//      _dio.options.headers = {"token": _userLoginBean.token.toString()};
//    }
//
//    Response response = null;
//    try {
//      response = await _dio.request(Api.BASE_URL + url,
//          queryParameters: queryParameters);
//
//      if (response != null) {
//        int errorCode = response.data["errorCode"];
//        String errorMsg = response.data["errorMsg"];
//        if (errorCode == Api.SUCCESS_CODE) {
//          return response.data["data"];
//        } else {
//          errorMsg = errorMsg != null ? errorMsg : "";
//          CommonUilt.shoToast(errorMsg, backgroundColor: Colors.red);
//          return Future.error(errorMsg);
//        }
//      }
//    } catch (e) {
//      return Future.error(e != null ? e : "");
//    }
//
//    return Future.error(response.statusMessage);
//  }

}
