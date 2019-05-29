import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/widget/StaggerAnimation.dart';

//效果来自flutter中文网
class JumpAnimationPage extends StatefulWidget {
  @override
  _JumpAnimationPageState createState() => _JumpAnimationPageState();
}

class _JumpAnimationPageState extends State<JumpAnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交错动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Hero(
            tag: "hero",
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              //调用我们定义的交错动画Widget
              child: StaggerAnimation(controller: _controller),
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }
}
