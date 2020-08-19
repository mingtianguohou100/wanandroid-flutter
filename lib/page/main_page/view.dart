import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wandroid_flutter/generated/i18n.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  MainState _appState = state.clone();
  ///退出APP确认提示
  Future<bool> exitAppTotast() async {
    return showDialog(
        context: viewService.context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: Text(S.of(viewService.context).sure_outlogin),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  S.of(viewService.context).click,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => SystemNavigator.pop(),
              ),
              RaisedButton(
                child: Text(S.of(viewService.context).cancel,
                    style: TextStyle(color: Colors.white)),
                onPressed: () =>
                    Navigator.of(viewService.context).pop(false),
              ),
            ],
          );
        }) ??
        Future.value(false);
  }

  return WillPopScope(
    child:Scaffold(
      body: _appState.pages[_appState.pagesPosition],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => dispatch(MainActionCreator.switchPage(index)),
        currentIndex: _appState.pagesPosition,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        selectedFontSize: 12,
        items: _appState.bottomNavigationBarItem,
      ),
    ),
    onWillPop: exitAppTotast,
  );



}
