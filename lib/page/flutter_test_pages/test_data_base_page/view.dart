import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';

import 'action.dart';
import 'db/sql_manager.dart';
import 'state.dart';

Widget buildView(
    TestDataBaseState state, Dispatch dispatch, ViewService viewService) {
  TestDataBaseState _testDataBaseState = state.clone();

  Widget _createBottomWidget(String txt, var click) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text(txt),
          onPressed: () => dispatch(click),
        ),
      ],
    );
  }

  return Scaffold(
    key: _testDataBaseState.globalKey,
    appBar: AppBar(
      title: Text(S.of(viewService.context).sqflite),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              _testDataBaseState.content != null
                  ? _testDataBaseState.content
                  : "--",
              style: TextStyle(fontSize: 30.0),
            ),
            margin: EdgeInsets.all(20.0),
          ),
          TextField(
            decoration: InputDecoration(hintText: "输入要查询删除或创建的表名"),
            controller: _testDataBaseState.textEditingController,
          ),
          _createBottomWidget(
              "查询表所有表", TestDataBaseActionCreator.onQueryAllTab()),
          _createBottomWidget("查询指定表", TestDataBaseActionCreator.onQueryTab()),
          _createBottomWidget("创建表", TestDataBaseActionCreator.onCreateTab()),
          _createBottomWidget("删除表", TestDataBaseActionCreator.onDeleteTab()),
        ],
      ),
    ),
  );
}
