//import 'package:dio/dio.dart';
//
/////Token拦截器
//class TokenInterceptors extends InterceptorsWrapper {
//  String _token;
//
//  @override
//  onRequest(RequestOptions options) {
//    // TODO: implement onRequest
//    if (_token != null) {
//      options.headers["Authorization"] = _token;
//    }
//    return options;
//  }
//
//  @override
//  onResponse(Response response) {
//    // TODO: implement onResponse
//    if (response.data["token"] != null) {
//      _token = "token" + response.data["token"];
//    }
//    return response;
//  }
//
//  ///清除token
//  ///获取token
//}
