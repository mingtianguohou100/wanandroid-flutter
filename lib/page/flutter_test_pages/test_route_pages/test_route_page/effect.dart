import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestRouteState> buildEffect() {
  return combineEffects(<Object, Effect<TestRouteState>>{
    TestRouteAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TestRouteState> ctx) {
}
