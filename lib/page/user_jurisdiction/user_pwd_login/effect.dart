import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wandroid_flutter/app/app_route.dart';
import 'package:wandroid_flutter/app/network/common_service.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'package:wandroid_flutter/utils/common_util.dart';
import 'package:wandroid_flutter/utils/toast_util.dart';
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
    },context: ctx.context).then((data) {
      ctx.dispatch(UserPwdLoginActionCreator.updAnimation("success"));
      ToastUtil.shoToast("登录成功");
    }, onError: (e) {
      ctx.dispatch(UserPwdLoginActionCreator.updAnimation("fail"));
    });
  } else {
    ctx.dispatch(UserPwdLoginActionCreator.updAnimation("fail"));
    ctx.state.global.currentState.showSnackBar(
        ToastUtil.showSnackBar(Text(S.of(ctx.context).checkinput)));
  }
}

void _onRegister(prefix0.Action action, Context<UserPwdLoginState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed(AppRoutePagePath.USER_PWD_REGISTER)
      .then((data) {
    data != null
        ? ctx.state.global.currentState.showSnackBar(
        ToastUtil.showSnackBar(Text(S.of(ctx.context).register_ok)))
        : null;
  });
}
