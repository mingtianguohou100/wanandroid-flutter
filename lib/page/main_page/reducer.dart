import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.switchPage:_switchPage,
    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

MainState _switchPage(MainState state, Action action) {
  final MainState newState = state.clone();
  int position=action.payload;
  newState.pagesPosition=position;
  return newState;
}