import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestRouteAction { action }

class TestRouteActionCreator {
  static Action onAction() {
    return const Action(TestRouteAction.action);
  }
}
