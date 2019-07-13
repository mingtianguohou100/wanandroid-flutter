import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  HomeState _homeState = state.clone();
  ListAdapter _adapter = viewService.buildAdapter();

  /*
  * 退出APP确认提示
  ***/
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
    child: Scaffold(
      appBar: AppBar(
        title: Text(S.of(viewService.context).home_title),
      ),
      drawer: viewService.buildComponent(HomeComponentName.SIDESLIP),
      floatingActionButton: _homeState.isShowTopWiget
          ? FloatingActionButton(
              onPressed: () => dispatch(HomeActionCreator.goTop()),
              child: Icon(Icons.keyboard_arrow_up),
              backgroundColor: GlobalConstant.themeList[_homeState.themeColor],
            )
          : null,
      body: EasyRefresh(
        key: _homeState.easyRefreshKey,
        child: ListView.builder(
          controller:_homeState.scrollController ,
          itemBuilder: _adapter.itemBuilder,
          itemCount: _adapter.itemCount,
        ),
        onRefresh: () async {
          dispatch(HomeActionCreator.onRefreshData());
          _homeState.easyRefreshKey.currentState.callRefreshFinish();
        },
        loadMore: () async {
          dispatch(HomeActionCreator.onMoreData());
          _homeState.easyRefreshKey.currentState.callLoadMoreFinish();
        },
      ),
    ),
    onWillPop: exitAppTotast,
  );
}
