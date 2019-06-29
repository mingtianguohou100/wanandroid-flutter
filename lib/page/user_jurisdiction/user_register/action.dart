import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserRegisterAction {onRegiestCheckRegister}

class UserRegisterActionCreator {

  static Action onRegiestCheckRegister() {
    return const Action(UserRegisterAction.onRegiestCheckRegister);
  }
}
