import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestRouteOneState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestRouteOneState>>{
      TestRouteOneAction.action: _onAction,
    },
  );
}

TestRouteOneState _onAction(TestRouteOneState state, Action action) {
  final TestRouteOneState newState = state.clone();
  return newState;
}
