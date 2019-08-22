import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserPwdLoginAction { onRegister, onLogin, updAnimation,successCallback }

class UserPwdLoginActionCreator {
  static Action onRegister() {
    return const Action(UserPwdLoginAction.onRegister);
  }

  static Action onLogin() {
    return const Action(UserPwdLoginAction.onLogin);
  }

  static Action updAnimation(String animationString) {
    return Action(UserPwdLoginAction.updAnimation, payload: animationString);
  }

  static Action successCallback() {
    return Action(UserPwdLoginAction.successCallback);
  }
}
