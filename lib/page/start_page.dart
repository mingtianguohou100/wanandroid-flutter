import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/page/main_page.dart';
import 'package:wanandroid_flutter/widget/network_loading_widget.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

VideoPlayerController _videoPlayerController;
VideoPlayerController _videoPlayerController_one;
VideoPlayerController _videoPlayerController_thread;

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  List<VideoPlayerController> _pageVideo;
  List<Widget> _cirArr;
  bool _isShowInto;
  bool _isShowCir;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isShowInto = true;
    _isShowCir = false;
    _videoPlayerController =
        VideoPlayerController.asset('resources/video/guide_one.mp4');
    _videoPlayerController_one =
        VideoPlayerController.asset('resources/video/guide_two.mp4');
    _videoPlayerController_thread =
        VideoPlayerController.asset('resources/video/guide_thread.mp4');



    _pageVideo = List();
    _pageVideo.add(_videoPlayerController);
    _pageVideo.add(_videoPlayerController_one);
    _pageVideo.add(_videoPlayerController_thread);
    _cirArr = List();
    _cirArr.add(Image.asset("resources/images/select_cir.png"));
    _cirArr.add(Image.asset("resources/images/no_select_cir.png"));
    _cirArr.add(Image.asset("resources/images/no_select_cir.png"));

    _pageController = PageController();

    Future<void> initController(VideoPlayerController controller) async {
      controller.setLooping(true);
      controller.setVolume(0.0);
      controller.play();
      await controller.initialize();
      if (mounted) setState(() {});
    }

    initController(_videoPlayerController);
    initController(_videoPlayerController_one);
    initController(_videoPlayerController_thread);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
//        DefaultTabController(
//          length: 3,
//          child: TabBarView(
//            children: <Widget>[
//              VideoPlayer(_videoPlayerController),
//              VideoPlayer(_videoPlayerController_one),
//              VideoPlayer(_videoPlayerController_thread),
//            ],
//          ),
//        ),
        PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _pageVideo.length,
            onPageChanged: (index) {
              setState(() {
                for (int i = 0; i < _cirArr.length; i++) {
                  if (index == i) {
                    _cirArr[i] = Image.asset("resources/images/select_cir.png");
                  } else {
                    _cirArr[i] =
                        Image.asset("resources/images/no_select_cir.png");
                  }

                  if (index == _cirArr.length - 1) {
                    _isShowInto = false;
                    _isShowCir = true;
                  } else {
                    _isShowInto = true;
                    _isShowCir = false;
                  }
                }
              });
            },
            controller: _pageController,
            itemBuilder: (context, index) {
              return VideoPlayer(_pageVideo[index]);
            }),

        Offstage(
          offstage: _isShowCir,
          child: Container(
              margin: EdgeInsets.only(bottom: 50.0),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _cirArr[0],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _cirArr[1],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _cirArr[2],
                  ),
                ],
              )),
        ),

        Offstage(
          offstage: _isShowInto,
          child: Container(
              margin: const EdgeInsets.all(30.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.red,
                child: Text(
                  "立即进入",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MainPage();
                  }));
                },
              )),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _videoPlayerController.dispose();
    _videoPlayerController_one.dispose();
    _videoPlayerController_thread.dispose();
  }
}
