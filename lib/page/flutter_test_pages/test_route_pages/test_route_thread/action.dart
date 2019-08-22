import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestRouteThreadAction { action }

class TestRouteThreadActionCreator {
  static Action onAction() {
    return const Action(TestRouteThreadAction.action);
  }
}
