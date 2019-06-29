import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/state.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/page/home_page/sideslip_page/state.dart';

class HomeComponentName {
  static final String SIDESLIP = "sideslip";
  ///首页列表滑动距离
  static const double HOMELIST_OFFSET_DATA=480.0;
}

class HomeState implements GlobalBaseState<HomeState> {
  @override
  Locale locale;

  @override
  int themeColor;

  @override
  UserLoginBean userLoginBean;

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
      ..isShowTopWiget=isShowTopWiget
      ..scrollController = scrollController
      ..themeColor = themeColor
      ..userLoginBean = userLoginBean
      ..homeBanners = homeBanners;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

class SideslipConnector extends ConnOp<HomeState, SideslipState> {
  get(HomeState homeState) => SideslipState()
    ..locale = homeState.locale
    ..userLoginBean = homeState.userLoginBean
    ..themeColor = homeState.themeColor;

  set(HomeState homeState, SideslipState sideslipState) {
    sideslipState.userLoginBean = homeState.userLoginBean;
    sideslipState.themeColor = homeState.themeColor;
    sideslipState.locale = homeState.locale;
  }
}
