import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestRouteTwoState> buildEffect() {
  return combineEffects(<Object, Effect<TestRouteTwoState>>{
    TestRouteTwoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TestRouteTwoState> ctx) {
}
