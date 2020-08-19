import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;
import 'package:wandroid_flutter/app/global_constant/global_theme_style.dart';

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
    if (newState.colorIndex < GlobalThemeStyle.themeList.length) {
      newState.colorIndex++;
    } else {
      newState.colorIndex = 0;
    }
    newState.lpwColor = GlobalThemeStyle.themeList[newState.colorIndex];
  }
  return newState;
}

SideslipState _closeLowPolyWolf(SideslipState state, prefix0.Action action) {
  final SideslipState newState = state.clone();
  newState.lpwString = "";
  newState.lpwAnimaIsCom = true;
  return newState;
}
