import 'package:fish_redux/fish_redux.dart';

class TestRouteState implements Cloneable<TestRouteState> {

  @override
  TestRouteState clone() {
    return TestRouteState();
  }
}

TestRouteState initState(Map<String, dynamic> args) {
  return TestRouteState();
}
