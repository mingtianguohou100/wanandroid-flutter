import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class StartState implements Cloneable<StartState> {
  PageController pageController;
  List<VideoPlayerController> pageVideo;
  List<Widget> cirArr;
  bool isShowInto;
  bool isShowCir;
  VideoPlayerController videoPlayerController;
  VideoPlayerController videoPlayerController_one;
  VideoPlayerController videoPlayerController_thread;

  StartState() {
    isShowInto = true;
    isShowCir = false;
    pageController = PageController();
    pageVideo = List();
    cirArr = List();

    videoPlayerController =
        VideoPlayerController.asset('resources/video/guide_one.mp4');
    videoPlayerController_one =
        VideoPlayerController.asset('resources/video/guide_two.mp4');
    videoPlayerController_thread =
        VideoPlayerController.asset('resources/video/guide_thread.mp4');

    pageVideo.add(videoPlayerController);
    pageVideo.add(videoPlayerController_one);
    pageVideo.add(videoPlayerController_thread);

    cirArr.add(Image.asset("resources/images/select_cir.png"));
    cirArr.add(Image.asset("resources/images/no_select_cir.png"));
    cirArr.add(Image.asset("resources/images/no_select_cir.png"));
  }

  @override
  StartState clone() {
    return StartState()
      ..pageController = pageController
      ..pageVideo = pageVideo
      ..cirArr = cirArr
      ..isShowInto = isShowInto
      ..isShowCir = isShowCir
      ..videoPlayerController = videoPlayerController
      ..videoPlayerController_one = videoPlayerController_one
      ..videoPlayerController_thread = videoPlayerController_thread;
  }
}

StartState initState(Map<String, dynamic> args) {
  return StartState();
}
