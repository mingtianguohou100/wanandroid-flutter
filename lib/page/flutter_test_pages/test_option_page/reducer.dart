import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestOptionState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestOptionState>>{
//      TestOptionAction.action: _onAction,
    },
  );
}

//TestOptionState _onAction(TestOptionState state, Action action) {
//  final TestOptionState newState = state.clone();
//  return newState;
//}
