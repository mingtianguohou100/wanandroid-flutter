import 'package:fish_redux/fish_redux.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'package:wandroid_flutter/widget/user_account_text_field_widget.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    UserPwdLoginState state, Dispatch dispatch, ViewService viewService) {
  UserPwdLoginState _userPwdLoginState = state.clone();

  ///  注册和登录的widget isLogin:true 登录按钮
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

  Widget _buildTeddy() {
    return Container(
      child: GestureDetector(
        onTap: () => dispatch(UserPwdLoginActionCreator.updAnimation("idle")),
        child: SizedBox(
          width: 500.0,
          height: 250.0,
          child: FlareActor(
            "resources/animations/Teddy.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            callback: (name) {
              if (name == "success")
                dispatch(UserPwdLoginActionCreator.successCallback());
            },
            animation: _userPwdLoginState.teddyString,
          ),
        ),
      ),
    );
  }

  return Scaffold(
    backgroundColor: Colors.blueGrey,
    key: _userPwdLoginState.global,
    appBar: AppBar(
      title: Text(S.of(viewService.context).login),
    ),
    body: Container(
//      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(15.0),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _userPwdLoginState.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    Image.asset("resources/images/flutter_logo.png",
//                        color: Theme.of(viewService.context).primaryColor),
                    _buildTeddy(),
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
