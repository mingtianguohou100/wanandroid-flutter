import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/widget/custom_route.dart';

import '../jump_animation_page.dart';

/**
 * 动画
 * **/
class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

//需要继承TickerProvider，如果只有单个AnimationController，则应该使用SingleTickerProviderStateMixin。
class _AnimationExampleState extends State<AnimationExample>
    with TickerProviderStateMixin {
  AnimationController _scoleAnimationController;
  Animation<double> _scoleAnimation;

  AnimationController _transparentAnimationController;
  Animation<double> _transparentAnimation;

  Animation<RelativeRect> animationTest;
  AnimationController controllerTest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScoleAnimationInit();
    initTransparentInit();

    controllerTest = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animationTest = RelativeRectTween(
            begin: RelativeRect.fromLTRB(200.0, 200.0, 200.0, 200.0),
            end: RelativeRect.fromLTRB(20.0, 20.0, 20.0, 20.0))
        .animate(controllerTest)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) {
              controllerTest.reverse();
            } else if (s == AnimationStatus.dismissed) {
              controllerTest.forward();
            }
          });
    controllerTest.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(WanAndroidLocalizations.of(context).animation_example)),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                width: _scoleAnimation.value,
                height: _scoleAnimation.value,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("开始缩放动画"),
                    onPressed: () {
                      _scoleAnimationController.forward();
                    },
                  ),
                  RaisedButton(
                    child: Text("停止缩放缩放"),
                    onPressed: () {
                      _scoleAnimationController.stop();
                    },
                  ),
                ],
              ),
              Opacity(
                child: Container(
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                ),
                opacity: _transparentAnimation.value,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("开始透明度动画"),
                    onPressed: () {
                      _transparentAnimationController.forward();
                    },
                  ),
                  RaisedButton(
                    child: Text("停止透明度缩放"),
                    onPressed: () {
                      _transparentAnimationController.stop();
                    },
                  ),
                ],
              ),
              Text(
                "flutter封装的动画",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SlideTransition(
                  position: new Tween(
                    begin: Offset(0.0, 0.0),
                    end: Offset(0.5, 0.3),
                  ).animate(controllerTest),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.red,
                    child: Text('滑动过渡'),
                  )),
              FadeTransition(
                  opacity: _transparentAnimation,
                  child: Container(
                    child: Text("透明过渡"),
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.green, width: 10.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  )),
              RotationTransition(
                  turns:
                      new Tween(begin: 0.0, end: 0.5).animate(controllerTest),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.red,
                    child: Text('旋转'),
                  )),
              ScaleTransition(
                  scale:
                      new Tween(begin: 1.0, end: 0.5).animate(controllerTest),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.red,
                    child: Text('缩放'),
                  )),
              SizeTransition(
                  axis: Axis.horizontal, //控制宽度或者高度缩放
                  sizeFactor: new Tween(begin: 1.0, end: 300.0)
                      .animate(_scoleAnimationController),
                  child: Container(
                    width: _scoleAnimation.value,
                    height: _scoleAnimation.value,
                    color: Colors.red,
                    child: Text('size变化'),
                  )),
              RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomRoute(JumpAnimationPage(),
                        roteTag: RouteTag.fade));
                  },
                  child: Hero(
                    child: Container(
                      color: Colors.amber,
                      width: 100.0,
                      height: 100.0,
                      child: Text("交错动画"),
                    ),
                    tag: "hero",
                  )),
            ],
          )
        ],
      ),
    );
  }

  void initScoleAnimationInit() {
    _scoleAnimationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    Animation ca = CurvedAnimation(
        parent: _scoleAnimationController,
        curve: Curves.bounceOut); //类似小球自由落地，回弹效果
    _scoleAnimation = Tween(begin: 0.0, end: 300.0).animate(ca);
    _scoleAnimation.addListener(() {
//        动画数值变换中不断刷新界面
      setState(() {});
    });
    _scoleAnimation.addStatusListener((status) {
//        动画结束时反转继续动画
      if (status == AnimationStatus.completed) {
        _scoleAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _scoleAnimationController.forward();
      }
    });
  }

  void initTransparentInit() {
    _transparentAnimationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _transparentAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_transparentAnimationController);
    _transparentAnimation.addListener(() {
//        动画数值变换中不断刷新界面
      setState(() {});
    });
    _transparentAnimation.addStatusListener((status) {
//        动画结束时反转继续动画
      if (status == AnimationStatus.completed) {
        _transparentAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _transparentAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scoleAnimationController.dispose();
    _transparentAnimationController.dispose();
    controllerTest.dispose();
  }
}
