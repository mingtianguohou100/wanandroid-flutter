import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/net/http_manager.dart';

/**
 * 全局统一的接口调用类
 * **/
class CommonService {
  static CommonService _instance;

  factory CommonService() {
    return _getInstance();
  }

  static CommonService get instance => _getInstance();

  static CommonService _getInstance() {
    if (_instance == null) {
      _instance = CommonService._internal();
    }
    return _instance;
  }

  CommonService._internal();

  ///退出登录
  Future logOut()=> HttpManager.instance.requestNetWork(Api.LOGIN_OUT);

  ///首页banner
  Future refreshBanner()=>HttpManager.instance.requestNetWork(Api.HOME_BANNER);

  ///首页文章列表
  Future refreshHomeList(int page)=>HttpManager.instance.requestNetWork(
      "article/list/" + (page == null ? 1 : page).toString() + "/json");

  ///登录
  Future getLogin(dynamic params)=> HttpManager.instance
      .requestNetWork(Api.LOGIN_URL, queryParameters: params,method: Api.POST_TYPE);

  ///注册
  Future getRegister(dynamic params)=>HttpManager.instance
      .requestNetWork(Api.REGISTER_URL, queryParameters: params,method: Api.POST_TYPE);


  ///收藏文章列表
  Future getCollectList()=>HttpManager.instance
      .requestNetWork(Api.COLLECT_LIST);

}
