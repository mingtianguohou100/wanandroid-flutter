import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestRouteTwoAction { action }

class TestRouteTwoActionCreator {
  static Action onAction() {
    return const Action(TestRouteTwoAction.action);
  }
}
