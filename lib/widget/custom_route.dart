import 'package:flutter/material.dart';

enum RouteTag {
  ratation,
  scale,
  fade,
  slide,
}

//自定义的路由转场动画
class CustomRoute extends PageRouteBuilder {
  Widget _widget;

  CustomRoute(
    this._widget, {
    RouteTag roteTag = RouteTag.ratation,
  }) : super(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return _widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (roteTag) {
              case RouteTag.ratation:
                //旋转
                return RotationTransition(
                  turns: Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                    child: child,
                  ),
                );
                break;
              case RouteTag.scale:
                //比例转换路由
                return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
              case RouteTag.fade:
                //淡出过渡路由
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
              case RouteTag.slide:
                //幻灯片路由
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
            }
          },
        );
}
