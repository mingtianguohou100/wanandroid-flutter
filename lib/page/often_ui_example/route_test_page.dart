import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteTestPage extends StatefulWidget {
  String data;

  RouteTestPage({this.data});

  @override
  _RouteTestPageState createState() => _RouteTestPageState();
}

class _RouteTestPageState extends State<RouteTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面"),
      ),
      body: Column(
        children: <Widget>[
          Text(widget.data!=null? "接收到值：${widget.data}" : "没有收到值"),
          RaisedButton(
            child: Text("返回并传递值"),
            onPressed: () {
              Navigator.of(context).pop("2222");
            },
          ),
        ],
      ),
    );
  }
}
