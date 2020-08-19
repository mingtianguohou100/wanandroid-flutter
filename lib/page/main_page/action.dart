import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action, switchPage }

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action switchPage(int position) {
    return Action(MainAction.switchPage, payload: position);
  }


}
