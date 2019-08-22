import 'package:fish_redux/fish_redux.dart';

class TestRouteTwoState implements Cloneable<TestRouteTwoState> {

  @override
  TestRouteTwoState clone() {
    return TestRouteTwoState();
  }
}

TestRouteTwoState initState(Map<String, dynamic> args) {
  return TestRouteTwoState();
}
