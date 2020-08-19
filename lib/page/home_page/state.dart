import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wandroid_flutter/app/global_fish_redux/state.dart';
import 'package:wandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:wandroid_flutter/model/HomeInfomationBean.dart';
import 'package:wandroid_flutter/page/home_page/sideslip_page/state.dart';
import 'package:wandroid_flutter/widget/big_green_guy_controller.dart';
import 'package:wandroid_flutter/widget/low_poly_wolf_controller.dart';

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
  String token;

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
      ..token = token
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
    ..token = homeState.token
    ..themeColor = homeState.themeColor;

  set(HomeState homeState, SideslipState sideslipState) {
    sideslipState.token = homeState.token;
    sideslipState.themeColor = homeState.themeColor;
    homeState.lpwColor = sideslipState.lpwColor;
    homeState.lpwString = sideslipState.lpwString;
    homeState.colorIndex = sideslipState.colorIndex;
    homeState.lpwAnimaIsCom = sideslipState.lpwAnimaIsCom;
    homeState.lowPolyWolfController = sideslipState.lowPolyWolfController;
    sideslipState.locale = homeState.locale;
  }
}
