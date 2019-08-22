import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestRouteState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestRouteState>>{
      TestRouteAction.action: _onAction,
    },
  );
}

TestRouteState _onAction(TestRouteState state, Action action) {
  final TestRouteState newState = state.clone();
  return newState;
}
