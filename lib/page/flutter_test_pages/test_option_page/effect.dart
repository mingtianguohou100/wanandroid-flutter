import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'action.dart';
import 'state.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Effect<TestOptionState> buildEffect() {
  return combineEffects(<Object, Effect<TestOptionState>>{
    TestOptionAction.onDataBase: _onDataBase,
    TestOptionAction.onRoute:_onRoute,
  });
}

///数据库界面
void _onDataBase(prefix0.Action action, Context<TestOptionState> ctx) =>
    Navigator.of(ctx.context).pushNamed(AppRoutePagePath.TEST_DATA_BASE);

///路由界面
void _onRoute(prefix0.Action action, Context<TestOptionState> ctx) =>
    Navigator.of(ctx.context).pushNamed(AppRoutePagePath.TEST_ROUTE);

