import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'action.dart';
import 'state.dart';
import 'package:common_utils/common_utils.dart';

Effect<AppState> buildEffect() {
  return combineEffects(<Object, Effect<AppState>>{
    Lifecycle.initState: _initState,
    AppAction.action: _onStartPage,
  });
}

///全局初始化
void _initState(Action action, Context<AppState> ctx) {
  LogUtil.init(isDebug: true, tag: "####wan_android_debug####");
}

void _onStartPage(Action action, Context<AppState> ctx) {}
