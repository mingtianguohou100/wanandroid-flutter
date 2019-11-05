import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'action.dart';
import 'state.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Effect<SideslipState> buildEffect() {
  return combineEffects(<Object, Effect<SideslipState>>{
    Lifecycle.initState: _onInitState,
    SideslipAction.onChangeLanguage: _onChangeLanguage,
    SideslipAction.onChangeThemeColor: _onChangeThemeColor,
    SideslipAction.onLogin: _onLogin,
    SideslipAction.onLoginOut: _onLoginOut,
  });
}

void _onInitState(prefix0.Action action, Context<SideslipState> ctx) {
  ctx.dispatch(SideslipActionCreator.lowPolyWolfClick());
}

void _onChangeLanguage(prefix0.Action action, Context<SideslipState> ctx) {
  GlobalStore.store
      .dispatch(GlobalActionCreator.changeLanguage(action.payload));
  Navigator.of(ctx.context).pop();
}

void _onChangeThemeColor(prefix0.Action action, Context<SideslipState> ctx) {
  GlobalStore.store
      .dispatch(GlobalActionCreator.changeThemeColor(action.payload));
  Navigator.of(ctx.context).pop();
}

void _onLogin(prefix0.Action action, Context<SideslipState> ctx) =>
    Navigator.of(ctx.context)
        .pushNamed(AppRoutePagePath.USER_PWD_LOGIN, arguments: action.payload);

void _onLoginOut(prefix0.Action action, Context<SideslipState> ctx) =>
    requestLogOut(ctx);

//退出登录
void requestLogOut(Context<SideslipState> ctx) async {
  CommonService.instance.logOut(context: ctx.context).then((data) {
    GlobalStore.store.dispatch(GlobalActionCreator.changeUserData(null));
  }, onError: (e) {});
}
