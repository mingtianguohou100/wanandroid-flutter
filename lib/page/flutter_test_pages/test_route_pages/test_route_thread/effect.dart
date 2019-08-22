import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestRouteThreadState> buildEffect() {
  return combineEffects(<Object, Effect<TestRouteThreadState>>{
    TestRouteThreadAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TestRouteThreadState> ctx) {
}
