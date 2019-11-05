import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/net/http_manager.dart';

///接口类
class CommonService {
  static CommonService _instance;

  factory CommonService() => _getInstance();

  static CommonService get instance => _getInstance();

  static CommonService _getInstance() {
    if (_instance == null) {
      _instance = CommonService._internal();
    }
    return _instance;
  }

  CommonService._internal();

  ///退出登录
  logOut({BuildContext context}) => HttpManager.instance.requestNetWork(Api.LOGIN_OUT,context: context);

  ///首页banner
  refreshBanner({BuildContext context}) =>
      HttpManager.instance.requestNetWork(Api.HOME_BANNER,context: context);

  ///首页文章列表
  refreshHomeList(int page, {BuildContext context}) =>
      HttpManager.instance.requestNetWork(
          "article/list/" + (page == null ? 1 : page).toString() + "/json",context: context);

  ///登录
  getLogin(dynamic params,{BuildContext context}) => HttpManager.instance.requestNetWork(Api.LOGIN_URL,
      queryParameters: params, method: Api.POST_TYPE,context: context);

  ///注册
  getRegister(dynamic params,{BuildContext context}) =>
      HttpManager.instance.requestNetWork(Api.REGISTER_URL,
          queryParameters: params, method: Api.POST_TYPE,context: context);

}
