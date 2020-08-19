import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wandroid_flutter/global/app_route.dart';
import 'action.dart';
import 'state.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Effect<StartState> buildEffect() {
  return combineEffects(<Object, Effect<StartState>>{
    StartAction.onClickHome: _onHome,
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
  });
}

void _onHome(prefix0.Action action, Context<StartState> ctx) {
  Navigator.of(ctx.context).pop();
  Navigator.of(ctx.context).pushNamed(AppRoutePagePath.MAIN_PAGE);
}

void _onInitState(prefix0.Action action, Context<StartState> ctx) {
  Future<void> initController(VideoPlayerController controller) async {
    controller.setLooping(true);
    controller.setVolume(0.0);
    controller.play();
    await controller.initialize();
  }

  initController(ctx.state.videoPlayerController);
  initController(ctx.state.videoPlayerController_one);
  initController(ctx.state.videoPlayerController_thread);
}

void _onDispose(prefix0.Action action, Context<StartState> ctx) {
  ctx.state.videoPlayerController.dispose();
  ctx.state.videoPlayerController_one.dispose();
  ctx.state.videoPlayerController_thread.dispose();
  ctx.state.pageController.dispose();
}
