import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

class ProgressWidget extends StatefulWidget {
  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).progress_widget),
      ),
      body: Column(
        children: <Widget>[
          createLinProgress(),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: createCirProgress(),
          ),
        ],
      ),
    );
  }

  /*
  * 线性进度条
  * **/
  Widget createLinProgress() {
    return LinearProgressIndicator();
  }

  /*
  *圆形进度条
  * **/
  Widget createCirProgress() {
    return CircularProgressIndicator();
  }
}
