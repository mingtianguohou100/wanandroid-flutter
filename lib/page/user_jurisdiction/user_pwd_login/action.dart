import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserPwdLoginAction { onRegister,onLogin }

class UserPwdLoginActionCreator {
  static Action onRegister() {
    return const Action(UserPwdLoginAction.onRegister);
  }

  static Action onLogin() {
    return const Action(UserPwdLoginAction.onLogin);
  }
}
