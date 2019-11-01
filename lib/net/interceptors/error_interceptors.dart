import 'package:connectivity/connectivity.dart';

import '../http_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

/////请求失败的拦截器
//class ErrorInterceptors extends InterceptorsWrapper{
//  Dio _dio;
//
//  ErrorInterceptors(this._dio);
//
//  @override
//  onRequest(RequestOptions options) async{
//    ///请求前判断若无网络，则取消请求,提示用户
//    var connectivityResult = await (Connectivity().checkConnectivity());
//    if (connectivityResult == ConnectivityResult.none) {
//      //通过_dio.resolve取消请求
//      _dio.reject("dddddd");
//      Fluttertoast.showToast(msg:"请连接网络!");
//    }
//
//  }
//
//  @override
//  onResponse(Response response) {
//    // TODO: implement onResponse
//    return super.onResponse(response);
//
//  }
//
//
//}