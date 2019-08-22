import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestRouteTwoState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestRouteTwoState>>{
      TestRouteTwoAction.action: _onAction,
    },
  );
}

TestRouteTwoState _onAction(TestRouteTwoState state, Action action) {
  final TestRouteTwoState newState = state.clone();
  return newState;
}
