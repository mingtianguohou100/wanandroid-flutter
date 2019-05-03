import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebPage extends StatefulWidget {
  String _title;
  String _url;

  MyWebPage(this._title, this._url);

  @override
  _MyWebPageState createState() => _MyWebPageState();
}

class _MyWebPageState extends State<MyWebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._title),
      ),
      url: widget._url,
    );
  }
}
