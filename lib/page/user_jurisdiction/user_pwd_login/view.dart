import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'package:wanandroid_flutter/widget/user_account_text_field_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserPwdLoginState state, Dispatch dispatch, ViewService viewService) {
  UserPwdLoginState _userPwdLoginState = state.clone();


  /*
  * 注册和登录的widget
  * isLogin:true 登录按钮
  * **/
  Widget createloginAndRestButton(bool isLogin) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: RaisedButton(
          color: Theme.of(viewService.context).primaryColor,
          child: Text(
              isLogin
                  ? S.of(viewService.context).login
                  : S.of(viewService.context).register,
              style: TextStyle(color: Colors.white)),
          onPressed: () => isLogin
              ? dispatch(UserPwdLoginActionCreator.onLogin())
              : dispatch(UserPwdLoginActionCreator.onRegister()),
        ),
      ),
    );
  }

  return Scaffold(
    key: _userPwdLoginState.global,
    appBar: AppBar(
      title: Text(S.of(viewService.context).login),
    ),
    body: Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(30.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
                key: _userPwdLoginState.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset("resources/images/flutter_logo.png",
                        color: Theme.of(viewService.context).primaryColor),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    UserAccountTextFieldWidget(
                        true, _userPwdLoginState.textEditingController_count),
                    UserAccountTextFieldWidget(false,
                        _userPwdLoginState.textEditingController_password),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        createloginAndRestButton(true),
                        createloginAndRestButton(false),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    ),
  );
}
