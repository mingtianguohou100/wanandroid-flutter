import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'action.dart';
import 'state.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Effect<HomeHeadState> buildEffect() {
  return combineEffects(<Object, Effect<HomeHeadState>>{
    HomeHeadAction.onClickBanner: _onClickBanner,
  });
}

void _onClickBanner(prefix0.Action action, Context<HomeHeadState> ctx) {
  HomeHeadBannerBean data= action.payload;
  Navigator.of(ctx.context)
      .pushNamed(AppRoutePagePath.CURRENCY_WEB_VIEW, arguments:{"title":data.title,"url":data.url});
}
