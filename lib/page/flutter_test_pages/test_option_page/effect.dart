import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'action.dart';
import 'state.dart';

Effect<TestOptionState> buildEffect() {
  return combineEffects(<Object, Effect<TestOptionState>>{
    TestOptionAction.onDataBase: _onDataBase,
  });
}

void _onDataBase(Action action, Context<TestOptionState> ctx) =>
    Navigator.of(ctx.context).pushNamed(AppRoutePagePath.TEST_DATA_BASE);
