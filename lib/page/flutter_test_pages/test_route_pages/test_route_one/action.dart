import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestRouteOneAction { action,onDataFinish }

class TestRouteOneActionCreator {
  static Action onAction() {
    return const Action(TestRouteOneAction.action);
  }

  static Action onDataFinish() {
    return const Action(TestRouteOneAction.onDataFinish);
  }
}
