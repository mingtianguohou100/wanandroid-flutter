import 'package:fish_redux/fish_redux.dart';

class TestRouteOneState implements Cloneable<TestRouteOneState> {

  @override
  TestRouteOneState clone() {
    return TestRouteOneState();
  }
}

TestRouteOneState initState(Map<String, dynamic> args) {
  return TestRouteOneState();
}
