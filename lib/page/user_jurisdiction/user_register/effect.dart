import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'action.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

import 'package:wanandroid_flutter/generated/i18n.dart';

import 'state.dart';
import 'package:flutter/cupertino.dart';

Effect<UserRegisterState> buildEffect() {
  return combineEffects(<Object, Effect<UserRegisterState>>{
    Lifecycle.initState: _onInitStete,
    Lifecycle.dispose: _onDispose,
    UserRegisterAction.onRegiestCheckRegister: _onRegiestCheckRegister,
  });
}

void _onInitStete(prefix0.Action action, Context<UserRegisterState> ctx) {
  ctx.state.global = GlobalKey<ScaffoldState>();
  ctx.state.formKey = GlobalKey<FormState>();
  ctx.state.textEditingController_count = TextEditingController();
  ctx.state.textEditingController_password = TextEditingController();
}

void _onDispose(prefix0.Action action, Context<UserRegisterState> ctx) {
  ctx.state.textEditingController_count.dispose();
  ctx.state.textEditingController_password.dispose();
}

void _onRegiestCheckRegister(prefix0.Action action, Context<UserRegisterState> ctx) {
  (ctx.state.formKey.currentState as FormState).validate()
      ? CommonService.instance.getRegister({
          "username": ctx.state.textEditingController_count.text,
          "password": ctx.state.textEditingController_password.text,
          "repassword": ctx.state.textEditingController_password.text,
        },context: ctx.context).then((data) {
          Navigator.of(ctx.context).pop(S.of(ctx.context).register_ok);
        }, onError: (e) {
          ctx.state.global.currentState
              .showSnackBar(CommonUilt.showSnackBar(Text(e)));
        })
      : ctx.state.global.currentState.showSnackBar(
          CommonUilt.showSnackBar(Text(S.of(ctx.context).checkinput)));
}
