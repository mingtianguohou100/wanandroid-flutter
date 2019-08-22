import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'action.dart';
import 'state.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Effect<TestRouteOneState> buildEffect() {
  return combineEffects(<Object, Effect<TestRouteOneState>>{
    TestRouteOneAction.action: _onAction,
    TestRouteOneAction.onDataFinish: _onDataFinish,
  });
}

void _onAction(prefix0.Action action, Context<TestRouteOneState> ctx) {}

void _onDataFinish(prefix0.Action action, Context<TestRouteOneState> ctx) {
  Navigator.of(ctx.context).pop("来自界面test-one的返回值");
}
