import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/widget/big_green_guy_controller.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
    HomeAction.goTop: _goTop,
    HomeAction.onRefreshData: _onRfreshDate,
    HomeAction.onMoreData: _onMoreData,
  });
}

_onInitState(prefix0.Action action, Context<HomeState> ctx) async {
  ctx.state.morePage = 1;
  ctx.state.isShowTopWiget = false;
  ctx.state.easyRefreshKey = GlobalKey<EasyRefreshState>();
  ctx.state.bigGreenGuyController = BigGreenGuyController();
  ctx.state.bggAnimationTag = true;
  ctx.state.bggAnimationString = "Walk";
  ctx.state.scrollController = ScrollController()
    ..addListener(() => ctx.dispatch(HomeActionCreator.checkShowTopWidget(
        ctx.state.scrollController.offset)));
  requestRefreshData(ctx, true);
}

_goTop(prefix0.Action action, Context<HomeState> ctx) => ctx
    .state.scrollController
    .animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.linear);

_onDispose(prefix0.Action action, Context<HomeState> ctx) {
  ctx.state.scrollController.dispose();
}

_onRfreshDate(prefix0.Action action, Context<HomeState> ctx) {
  requestRefreshData(ctx, false);
}

_onMoreData(prefix0.Action action, Context<HomeState> ctx) =>
    requestMoreData(ctx);

requestRefreshData(Context<HomeState> ctx, bool isOneReques) async {
  List<HomeHeadBannerBean> homeBannerList;
  List<Datas> homeInfomationList;
  await CommonService.instance.refreshHomeList(1,context: ctx.context).then((data) {
    homeInfomationList = HomeInfomationBean.fromJson(data).datas;

    CommonService.instance.refreshBanner(context: ctx.context).then((data) {
      homeBannerList = getHomeHeadBannerBeanList(data);
      isOneReques
          ? ctx.dispatch(
              HomeActionCreator.initData(homeInfomationList, homeBannerList))
          : ctx.dispatch(HomeActionCreator.refreshData(
              homeInfomationList, homeBannerList));
    }, onError: (e) {

    });
  }, onError: (e) {
  });
}

///加载更多
requestMoreData(Context<HomeState> ctx) async {
  int morePage = ctx.state.morePage;
  CommonService.instance.refreshHomeList(morePage++).then((data) {
    List<Datas> homeItems = HomeInfomationBean.fromJson(data).datas;
    ctx.dispatch(HomeActionCreator.moreData(homeItems));
  }, onError: (e) {});
}
