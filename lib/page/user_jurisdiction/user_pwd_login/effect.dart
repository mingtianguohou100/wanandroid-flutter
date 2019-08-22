import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'action.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

import 'state.dart';

Effect<UserPwdLoginState> buildEffect() {
  return combineEffects(<Object, Effect<UserPwdLoginState>>{
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
    UserPwdLoginAction.onLogin: _onLogin,
    UserPwdLoginAction.onRegister: _onRegister,
    UserPwdLoginAction.successCallback: _successCallback,
  });
}

void _onInitState(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  ctx.state.teddyString = "idle";
  ctx.state.global = GlobalKey<ScaffoldState>();
  ctx.state.formKey = GlobalKey<FormState>();
  ctx.state.textEditingController_count = TextEditingController();
  ctx.state.textEditingController_count.addListener(() {
    ctx.dispatch(UserPwdLoginActionCreator.updAnimation("test"));
  });
  ctx.state.textEditingController_password = TextEditingController();
  ctx.state.textEditingController_password.addListener(() {
    ctx.dispatch(UserPwdLoginActionCreator.updAnimation("test"));
  });
}

void _onDispose(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  ctx.state.textEditingController_count.dispose();
  ctx.state.textEditingController_password.dispose();
}

void _successCallback(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onLogin(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  if (ctx.state.formKey.currentState.validate()) {
    CommonService.instance.getLogin({
      "username": ctx.state.textEditingController_count.text,
      "password": ctx.state.textEditingController_password.text,
    }).then((data) {
      ctx.dispatch(UserPwdLoginActionCreator.updAnimation("success"));
      CommonUilt.shoToast("登录成功");
      GlobalStore.store.dispatch(
          GlobalActionCreator.changeUserData(UserLoginBean.fromJson(data)));
    }, onError: (e) {
      ctx.dispatch(UserPwdLoginActionCreator.updAnimation("fail"));
    });
  } else {
    ctx.dispatch(UserPwdLoginActionCreator.updAnimation("fail"));
    ctx.state.global.currentState.showSnackBar(
        CommonUilt.showSnackBar(Text(S.of(ctx.context).checkinput)));
  }
}

void _onRegister(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed(AppRoutePagePath.USER_PWD_REGISTER)
      .then((data) {
    data != null
        ? ctx.state.global.currentState.showSnackBar(
            CommonUilt.showSnackBar(Text(S.of(ctx.context).register_ok)))
        : null;
  });
}
