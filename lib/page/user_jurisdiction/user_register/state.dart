import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRegisterState implements Cloneable<UserRegisterState> {
  GlobalKey<FormState> formKey;
  GlobalKey<ScaffoldState> global;
  TextEditingController textEditingController_count;
  TextEditingController textEditingController_password;

  @override
  UserRegisterState clone() {
    return UserRegisterState()
      ..formKey = formKey
      ..global = global
      ..textEditingController_count = textEditingController_count
      ..textEditingController_password = textEditingController_password;
  }
}

UserRegisterState initState(Map<String, dynamic> args) {
  return UserRegisterState();
}
