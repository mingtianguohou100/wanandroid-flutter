import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestRouteThreadState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestRouteThreadState>>{
      TestRouteThreadAction.action: _onAction,
    },
  );
}

TestRouteThreadState _onAction(TestRouteThreadState state, Action action) {
  final TestRouteThreadState newState = state.clone();
  return newState;
}
