import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'action.dart';
import 'state.dart';

Reducer<StartState> buildReducer() {
  return asReducer(
    <Object, Reducer<StartState>>{
      StartAction.pageview_slide_listner: _pageview_listner,
    },
  );
}

StartState _pageview_listner(StartState state, Action action) {
  int index=action.payload;

  final StartState newState = state.clone();
  for (int i = 0; i < newState.cirArr.length; i++) {
    if (index == i) {
      newState.cirArr[i] = Image.asset("resources/images/select_cir.png");
    } else {
      newState..cirArr[i] =
          Image.asset("resources/images/no_select_cir.png");
    }

    if (index ==  newState.cirArr.length - 1) {
      newState.isShowInto = false;
      newState.isShowCir = true;
    } else {
      newState.isShowInto = true;
      newState.isShowCir = false;
    }
  }
  return newState;
}
