import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'package:wandroid_flutter/widget/user_account_text_field_widget.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    UserRegisterState state, Dispatch dispatch, ViewService viewService) {
  UserRegisterState _userRegisterState = state.clone();


  return Scaffold(
    key: _userRegisterState.global,
    appBar: AppBar(
      title: Text(S.of(viewService.context).register),
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
                key: _userRegisterState.formKey,
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
                        true, _userRegisterState.textEditingController_count),
                    UserAccountTextFieldWidget(false,
                        _userRegisterState.textEditingController_password),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RaisedButton(
                                color:
                                    Theme.of(viewService.context).primaryColor,
                                child: Text(
                                  S.of(viewService.context).submission,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: ()=>dispatch(UserRegisterActionCreator.onRegiestCheckRegister()),
                              )),
                        ),
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
