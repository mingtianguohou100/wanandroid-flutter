import 'package:dio/dio.dart';

import '../api.dart';

///日志
class LogInterceptors extends InterceptorsWrapper{

@override
  onResponse(Response response) {
    // TODO: implement onResponse
  if (Api.DEBUG) {
    if (response != null) {
      print("HttpManager返回参数:${response.toString()}");
    }
  }
  return response; // contin
  }

  @override
  onRequest(RequestOptions options) {
    if(Api.DEBUG){
      print("HttpManager请求url：${options.path}");
      print("HttpManager请求头:${options.headers.toString()}");
      if (options.data != null) {
        print("HttpManager请求参数:${options.data.toString()}");
      }
    }
    return options;
  }


}