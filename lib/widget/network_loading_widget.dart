import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

/**
 * 网络加载的loading
 * **/
class NetworkLoadingWidget extends StatefulWidget {
  @override
  _NetworkLoadingWidgetState createState() => _NetworkLoadingWidgetState();
}

class _NetworkLoadingWidgetState extends State<NetworkLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: CircularProgressIndicator(),
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              ),
              Padding(
                child: Text(
                  WanAndroidLocalizations.of(context).net_work_loading,
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                ),
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
