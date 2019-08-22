import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    TestRouteOneState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(title: Text("test1")),
    body: RaisedButton(
      onPressed: () => dispatch(TestRouteOneActionCreator.onDataFinish()),
      child: Text("关闭并传递返回值!"),
    ),
  );
}
