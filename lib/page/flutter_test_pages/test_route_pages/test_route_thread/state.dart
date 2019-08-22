import 'package:fish_redux/fish_redux.dart';

class TestRouteThreadState implements Cloneable<TestRouteThreadState> {

  @override
  TestRouteThreadState clone() {
    return TestRouteThreadState();
  }
}

TestRouteThreadState initState(Map<String, dynamic> args) {
  return TestRouteThreadState();
}
