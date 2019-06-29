import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppState>>{
     AppAction.action: _switchLanguage,
    },
  );
}

AppState _switchLanguage(AppState state, Action action) {
  final AppState newState = state.clone();
  return newState;
}
