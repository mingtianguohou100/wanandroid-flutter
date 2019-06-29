import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestOptionAction { onDataBase }

class TestOptionActionCreator {
  static Action onDataBase() {
    return const Action(TestOptionAction.onDataBase);
  }
}
