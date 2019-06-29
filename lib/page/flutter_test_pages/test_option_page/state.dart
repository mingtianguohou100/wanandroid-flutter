import 'package:fish_redux/fish_redux.dart';

class TestOptionState implements Cloneable<TestOptionState> {

  @override
  TestOptionState clone() {
    return TestOptionState();
  }
}

TestOptionState initState(Map<String, dynamic> args) {
  return TestOptionState();
}
