import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';

//TODO replace with your own action
enum HomeAction {
  initData,
  onRefreshData,
  onMoreData,
  refreshData,
  moreData,
  goTop,
  checkShowTopWidget,
  bggClick,
}

class HomeActionCreator {
  static Action onRefreshData() {
    return const Action(HomeAction.onRefreshData);
  }

  static Action bggClick() {
    return const Action(HomeAction.bggClick);
  }

  static Action onMoreData() {
    return const Action(HomeAction.onMoreData);
  }

  static Action initData(
      List<Datas> homeItem, List<HomeHeadBannerBean> homeBanners) {
    return Action(HomeAction.initData, payload: Tuple2(homeItem, homeBanners));
  }

  static Action refreshData(
      List<Datas> homeItem, List<HomeHeadBannerBean> homeBanners) {
    return Action(HomeAction.refreshData,
        payload: Tuple2(homeItem, homeBanners));
  }

  static Action moreData(List<Datas> homeItem) {
    return Action(HomeAction.moreData, payload: homeItem);
  }

  static Action goTop() {
    return Action(HomeAction.goTop);
  }

  static Action checkShowTopWidget(double offset) {
    return Action(HomeAction.checkShowTopWidget, payload: offset);
  }
}
