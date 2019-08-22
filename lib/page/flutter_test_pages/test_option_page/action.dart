import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestOptionAction { onDataBase,onRoute }

class TestOptionActionCreator {
  static Action onDataBase() {
    return const Action(TestOptionAction.onDataBase);
  }

  static Action onRoute() {
    return const Action(TestOptionAction.onRoute);
  }
}
