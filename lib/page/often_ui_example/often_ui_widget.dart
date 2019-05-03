import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/page/often_ui_example/progress_widget.dart';
import 'package:wanandroid_flutter/page/often_ui_example/route_widget.dart';
import 'package:wanandroid_flutter/page/often_ui_example/select_widget.dart';

import 'dialog_widget.dart';
import 'input_widget.dart';
import 'layout_widget.dart';

/**
 * 常用UI控件
 * **/
class OftenUiWidget extends StatefulWidget {
  @override
  _OftenUiWidgetState createState() => _OftenUiWidgetState();
}

class _OftenUiWidgetState extends State<OftenUiWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).oftenUiWidget),
      ),
      body: ListView(
        children: <Widget>[
          //输入框
          createItem(WanAndroidLocalizations.of(context).form_option, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return InputWidget();
            }));
          }),

          //选项框
          createItem(WanAndroidLocalizations.of(context).select_widget, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return SelectWidget();
            }));
          }),

          //弹框
          createItem(WanAndroidLocalizations.of(context).dialog_widget, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return DialogWidget();
            }));
          }),


          //进度条
          createItem(WanAndroidLocalizations.of(context).progress_widget, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ProgressWidget();
            }));
          }),

          //布局控件
          createItem(WanAndroidLocalizations.of(context).layout_example, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return LayoutWidget();
            }));
          }),

          //跳转
          createItem(WanAndroidLocalizations.of(context).route_widget, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext bc) {
              return RouteWidget();
            }));
          }),
        ],
      ),
    );
  }

  Widget createItem(String name, GestureTapCallback fc) {
    return ListTile(
      selected: true,
      title: Text(
        name,
        style: TextStyle(color: Colors.black),
      ),
      leading: Icon(
        Icons.star,
      ),
      onTap: fc,
    );
  }
}
