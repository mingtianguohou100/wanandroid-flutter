import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

import 'action.dart';
import 'state.dart';

Reducer<SideslipState> buildReducer() {
  return asReducer(
    <Object, Reducer<SideslipState>>{
      SideslipAction.lowPolyWolfClick: _lowPolyWolfClick,
      SideslipAction.closeLowPolyWolf: _closeLowPolyWolf,
    },
  );
}

SideslipState _lowPolyWolfClick(SideslipState state, prefix0.Action action) {
  final SideslipState newState = state.clone();

  if (newState.lpwAnimaIsCom) {
    newState.lpwAnimaIsCom = false;
    newState.lpwString = "Go";
    if (newState.colorIndex < GlobalConstant.themeList.length) {
      newState.colorIndex++;
    } else {
      newState.colorIndex = 0;
    }
    newState.lpwColor = GlobalConstant.themeList[newState.colorIndex];
  }
  return newState;
}

SideslipState _closeLowPolyWolf(SideslipState state, prefix0.Action action) {
  final SideslipState newState = state.clone();
  newState.lpwString = "";
  newState.lpwAnimaIsCom = true;
  return newState;
}
