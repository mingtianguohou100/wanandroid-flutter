import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:nima/nima_actor.dart';
import 'package:wandroid_flutter/app/global_constant/global_theme_style.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  HomeState _homeState = state.clone();
  ListAdapter _adapter = viewService.buildAdapter();

  return  Scaffold(
    appBar: AppBar(
      title: Text(S.of(viewService.context).home_title),
    ),
    drawer: viewService.buildComponent(HomeComponentName.SIDESLIP),
    floatingActionButton: _homeState.isShowTopWiget
        ? FloatingActionButton(
      onPressed: () => dispatch(HomeActionCreator.goTop()),
      child: Icon(Icons.keyboard_arrow_up),
      backgroundColor: _homeState.themeColor != null
          ? GlobalThemeStyle.themeList[_homeState.themeColor]
          : GlobalThemeStyle.themeList[0],
    )
        : null,
    body: Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        EasyRefresh(
          key: _homeState.easyRefreshKey,
          child: ListView.builder(
            controller: _homeState.scrollController,
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
        GestureDetector(
          onTap: () => dispatch(HomeActionCreator.bggClick()),
          child: Container(
            child: NimaActor(
              "resources/animations/Big Green Guy.nima",
              alignment: Alignment.center,
              fit: BoxFit.scaleDown,
              controller: _homeState.bigGreenGuyController,
              animation: _homeState.bggAnimationString,
            ),
            margin: EdgeInsets.only(bottom: 100, right: 10),
            width: 200.0,
            height: 200.0,
          ),
        ),
      ],
    ),
  );
}
