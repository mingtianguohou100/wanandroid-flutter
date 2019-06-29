import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'action.dart';
import 'state.dart';

Effect<SideslipState> buildEffect() {
  return combineEffects(<Object, Effect<SideslipState>>{
    SideslipAction.onChangeLanguage: _onChangeLanguage,
    SideslipAction.onChangeThemeColor: _onChangeThemeColor,
    SideslipAction.onLogin: _onLogin,
    SideslipAction.onLoginOut: _onLoginOut,
    SideslipAction.onJumpTestOption: _onJumpTestOption,
  });
}

void _onChangeLanguage(Action action, Context<SideslipState> ctx) {
  GlobalStore.store
      .dispatch(GlobalActionCreator.changeLanguage(action.payload));
  Navigator.of(ctx.context).pop();
}

void _onChangeThemeColor(Action action, Context<SideslipState> ctx) {
  GlobalStore.store
      .dispatch(GlobalActionCreator.changeThemeColor(action.payload));
  Navigator.of(ctx.context).pop();
}

void _onLogin(Action action, Context<SideslipState> ctx) =>
    Navigator.of(ctx.context)
        .pushNamed(AppRoutePagePath.USER_PWD_LOGIN, arguments: action.payload);

void _onLoginOut(Action action, Context<SideslipState> ctx) => requestLogOut();

//跳转testOptionPage
void _onJumpTestOption(Action action, Context<SideslipState> ctx) =>
    Navigator.of(ctx.context).pushNamed(AppRoutePagePath.TEST_OPTION);

//退出登录
void requestLogOut() async{
  CommonService.instance.logOut().then((data) {
    GlobalStore.store.dispatch(GlobalActionCreator.changeUserData(null));
  }, onError: (e) {});
}
