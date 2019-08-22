import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/state.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/page/home_page/sideslip_page/state.dart';
import 'package:wanandroid_flutter/widget/big_green_guy_controller.dart';
import 'package:wanandroid_flutter/widget/low_poly_wolf_controller.dart';

class HomeComponentName {
  static final String SIDESLIP = "sideslip";

  ///首页列表滑动距离
  static const double HOMELIST_OFFSET_DATA = 480.0;
}

class HomeState implements GlobalBaseState<HomeState> {
  @override
  Locale locale;

  @override
  int themeColor;

  @override
  UserLoginBean userLoginBean;

  ///绿巨人
  BigGreenGuyController bigGreenGuyController;
  String bggAnimationString;
  bool bggAnimationTag;

  ///狼
  Color lpwColor = Colors.black;
  String lpwString = "";
  int colorIndex = 0;
  bool lpwAnimaIsCom = true;
  LowPolyWolfController lowPolyWolfController = LowPolyWolfController();

  GlobalKey<EasyRefreshState> easyRefreshKey;

  int morePage;

  ScrollController scrollController;
  bool isShowTopWiget;
  List<Datas> homeItems;
  List<HomeHeadBannerBean> homeBanners;

  @override
  HomeState clone() {
    return HomeState()
      ..morePage = morePage
      ..easyRefreshKey = easyRefreshKey
      ..homeItems = homeItems
      ..locale = locale
      ..lpwString = lpwString
      ..lpwColor = lpwColor
      ..lpwAnimaIsCom = lpwAnimaIsCom
      ..colorIndex = colorIndex
      ..bggAnimationString = bggAnimationString
      ..bggAnimationTag = bggAnimationTag
      ..bigGreenGuyController = bigGreenGuyController
      ..isShowTopWiget = isShowTopWiget
      ..scrollController = scrollController
      ..themeColor = themeColor
      ..userLoginBean = userLoginBean
      ..lowPolyWolfController = lowPolyWolfController
      ..homeBanners = homeBanners;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

class SideslipConnector extends ConnOp<HomeState, SideslipState> {
  get(HomeState homeState) => SideslipState()
    ..locale = homeState.locale
    ..lpwColor = homeState.lpwColor
    ..lpwString = homeState.lpwString
    ..colorIndex = homeState.colorIndex
    ..lowPolyWolfController = homeState.lowPolyWolfController
    ..lpwAnimaIsCom = homeState.lpwAnimaIsCom
    ..userLoginBean = homeState.userLoginBean
    ..themeColor = homeState.themeColor;

  set(HomeState homeState, SideslipState sideslipState) {
    sideslipState.userLoginBean = homeState.userLoginBean;
    sideslipState.themeColor = homeState.themeColor;
    homeState.lpwColor = sideslipState.lpwColor;
    homeState.lpwString = sideslipState.lpwString;
    homeState.colorIndex = sideslipState.colorIndex;
    homeState.lpwAnimaIsCom = sideslipState.lpwAnimaIsCom;
    homeState.lowPolyWolfController = sideslipState.lowPolyWolfController;
    sideslipState.locale = homeState.locale;
  }
}
