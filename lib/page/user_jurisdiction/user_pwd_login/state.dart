import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPwdLoginState implements Cloneable<UserPwdLoginState> {
  GlobalKey<FormState> formKey;
  GlobalKey<ScaffoldState> global;
  TextEditingController textEditingController_count;
  TextEditingController textEditingController_password;

  @override
  UserPwdLoginState clone() {
    return UserPwdLoginState()
      ..formKey = formKey
      ..global = global
      ..textEditingController_count = textEditingController_count
      ..textEditingController_password = textEditingController_password;
  }
}

UserPwdLoginState initState(Map<String, dynamic> args) {
  return UserPwdLoginState();
}
