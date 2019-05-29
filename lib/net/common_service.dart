import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/model/Bean.dart';
import 'package:wanandroid_flutter/model/HomeBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeWzListBean.dart';
import 'package:wanandroid_flutter/model/NewBanner.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/api.dart';
import 'package:wanandroid_flutter/net/http_manager.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

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

  CommonService._internal() {}

  /*
  * 首页banner
  * **/
  void getHomeBannerData(Function onSuccess, {Function onErro}) {
    HttpManager.instance.requestGet("banner/json", (data) {
      HomeBannerBean homeBannerBean = HomeBannerBean.fromJson(data);
      onSuccess(homeBannerBean.data);
    }, onErro: (e) {
      onErro(e);
    });
  }


  /*
  * 首页banner
  * **/
  void testData() {

    HttpManager.instance.requestNet("/hsdfsdfotkey/jssdfsdfsdfon",onReceiveProgress:(int count, int total){
      print("ddwwwwww获取进度:"+count.toString()+","+total.toString());
    } ,onSendProgress: (int count, int total){
      print("ddwwwwww请求进度:"+count.toString()+","+total.toString());
    },onSuccess: (data){
      NewBanner homeBannerBean = NewBanner.fromJson(data);
      print("oooopop请求成功");
    },onError: (e){
      print("oooopop请求失败${e!=null?e:""}");
    },onFinish: (){
      print("oooopop请求完成");

    });

  }


  /*
  * 首页文章列表
  * **/
  void getHomeWzList(Function onSuccess, {Function onErro, int page}) {
    HttpManager.instance.requestGet(
        "article/list/" + (page == null ? 0 : page).toString() + "/json",
        (data) {
      HomeWzListBean homeBannerBean = HomeWzListBean.fromJson(data);
      HomeWzListItemModel hwim = homeBannerBean.data;
      onSuccess(hwim.datas);
    }, onErro: (e) {
      onErro(e);
    });
  }






  /*
  * 首页搜索
  * **/
  void getSearData(dynamic params,Function onSuccess, {Function onErro, int page}) {
    HttpManager.instance.requestPost(Api.SEARCH_DATA, (data) {
      HomeWzListBean homeBannerBean = HomeWzListBean.fromJson(data);
      HomeWzListItemModel hwim = homeBannerBean.data;
      onSuccess(hwim.datas);
    }, onErro: (e) {
      onErro(e);
    },params: FormData.from(params),);
  }

//  /*
//  * 添加站内收藏
//  * **/
//  void getAddCollect(int id, Function onSuccess, {Function onErro}) {
//    HttpManager.instance.requestPost("lg/collect/" + id.toString() + "/json",
//        (data) {
//      Bean bean = Bean.fromJson(data);
//      onSuccess(bean.data);
//    }, onErro: (e) {
//      onErro(e);
//    });
//  }

//  /*
//  * 取消列表收藏
//  * **/
//  void getUncollectCollect(int id, Function onSuccess, {Function onErro}) {
//    HttpManager.instance
//        .requestPost("lg/uncollect_originId/" + id.toString() + "json", (data) {
//      Bean bean = Bean.fromJson(data);
//      onSuccess(bean.data);
//    }, onErro: (e) {
//      onErro(e);
//    });
//  }

  /*
  * 登录
  * **/
  void getLogin(dynamic params, Function onSuccess, {Function onErro}) async {
    HttpManager.instance.requestPost(
        Api.LOGIN_URL,
        (data, cookie) {
          UserLoginBean user_login_bean = UserLoginBean.fromJson(data);
          onSuccess(user_login_bean.data.username, cookie);
        },
        params: FormData.from(params),
        onErro: (e) {
          onErro(e);
        },
        isLogin: true);
  }

  /*
  * 注册
  * **/
  void getRegister(dynamic params, Function onSuccess, {Function onErro}) {
    HttpManager.instance.requestPost(
        Api.REGISTER_URL,
        (data) {
          UserLoginBean bean = UserLoginBean.fromJson(data);
          onSuccess(bean.data);
        },
        params: FormData.from(params),
        onErro: (e) {
          onErro(e);
        });
  }

  /*
  * 退出登录
  * **/
  void getLogOut(Function onSuccess, {Function onErro}) {
    HttpManager.instance.requestGet(Api.LOGIN_OUT, (data) {
      Bean bean = Bean.fromJson(data);
      SpUtils.clearUserInfo();
      onSuccess(bean.data);
    }, onErro: (e) {
      onErro(e);
    });
  }

//  /*
//  * 我喜欢的
//  * **/
//  void getMyLikes(int page, Function onSuccess, {Function onErro}) {
//    HttpManager.instance
//        .requestGet("lg/collect/list/" + page.toString() + "/json", (data) {
//      print("dasdasfaf2222=" + data.toString());
//      onSuccess();
//    }, onErro: (e) {
//      print("dasdasfaf2222=" + e.toString());
//    });
//  }
}
