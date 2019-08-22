import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    TestOptionState state, Dispatch dispatch, ViewService viewService) {
  TestOptionState _testOptionState = state.clone();
  S _i18nS = S.of(viewService.context);

  Widget createItem(String name, var fc) {
    return ListTile(
      selected: true,
      title: Text(
        name,
        style: TextStyle(color: Colors.black),
      ),
      leading: Icon(
        Icons.star,
      ),
      onTap: () => dispatch(fc),
    );
  }

  return Scaffold(
    appBar: AppBar(
      title: Text(_i18nS.often_ui_widget),
    ),
    body: ListView(
      children: <Widget>[
//        //数据库
//        createItem(_i18nS.sqflite, () {
//          TestOptionActionCreator.onDataBase();
//        }),
        //数据库
        createItem(_i18nS.route_widget, TestOptionActionCreator.onRoute()),
      ],
    ),
  );
}
