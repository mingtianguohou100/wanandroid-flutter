import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDataBaseState implements Cloneable<TestDataBaseState> {
  String content;
  TextEditingController textEditingController;
  GlobalKey<ScaffoldState> globalKey;

  @override
  TestDataBaseState clone() {
    return TestDataBaseState()
      ..content = content
      ..globalKey=globalKey
      ..textEditingController = textEditingController;
  }
}

TestDataBaseState initState(Map<String, dynamic> args) {
  return TestDataBaseState();
}
