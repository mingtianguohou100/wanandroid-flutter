import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';
import 'action.dart';

Effect<Datas> buildEffect() {
  return combineEffects(<Object, Effect<Datas>>{
    HomeItemAction.onItemClick: _onItemClick,
  });
}

void _onItemClick(Action action, Context<Datas> ctx)=>Navigator.of(ctx.context).pushNamed(AppRoutePagePath.CURRENCY_WEB_VIEW,
    arguments: {"title": ctx.state.title, "url": ctx.state.link});
