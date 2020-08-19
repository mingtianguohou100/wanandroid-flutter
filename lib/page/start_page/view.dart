
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(StartState state, Dispatch dispatch, ViewService viewService) {
  StartState _startState = state.clone();

  ///指示器
  Widget _buildIndicators() {
    return Offstage(
      offstage: _startState.isShowCir,
      child: Container(
          margin: EdgeInsets.only(bottom: 50.0),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: _startState.cirArr[0],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: _startState.cirArr[1],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: _startState.cirArr[2],
              ),
            ],
          )),
    );
  }

  ///立即进入
  Widget _buildGoToButton() {
    return Offstage(
      offstage: _startState.isShowInto,
      child: Container(
          margin: const EdgeInsets.all(30.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8)),
            color: Colors.red,
            child: Text(
              S.of(viewService.context).now_into,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            onPressed: () => dispatch(StartActionCreator.onHome()),
          )),
    );
  }

  ///pageview
  Widget _buildPageVew() {
    return PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _startState.pageVideo.length,
        onPageChanged: (index) {
          dispatch(StartActionCreator.pageview_listner(index));
        },
        controller: _startState.pageController,
        itemBuilder: (context, index) {
          return VideoPlayer(_startState.pageVideo[index]);
        });
  }

  return Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      _buildPageVew(),
      _buildIndicators(),
      _buildGoToButton(),
    ],
  );
}
