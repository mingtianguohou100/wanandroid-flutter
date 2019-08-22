import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserPwdLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPwdLoginState>>{
      UserPwdLoginAction.updAnimation: _updAnimation,
    },
  );
}

UserPwdLoginState _updAnimation(UserPwdLoginState state, Action action) {
  String animationString = action.payload;
  final UserPwdLoginState newState = state.clone();
  newState.teddyString = animationString;
  return newState;
}


UserPwdLoginState _loginSuccess(UserPwdLoginState state, Action action) {
  final UserPwdLoginState newState = state.clone();


  return newState;
}
