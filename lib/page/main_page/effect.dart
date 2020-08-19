import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wandroid_flutter/global/app_route.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState:_initState,
  });
}

void _initState(action, Context<MainState> ctx) async {
  ctx.state.bottomNavigationBarItem=List();
  ctx.state.bottomNavigationBarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
  ];
  ctx.state.pages=List();
  ctx.state.pages = [
    AppRoute.pageRoutes.buildPage(AppRoutePagePath.HOME_PAGE, null),
    AppRoute.pageRoutes.buildPage(AppRoutePagePath.HOME_PAGE, null)
  ];
  ctx.state.pagesPosition = 0;
}
