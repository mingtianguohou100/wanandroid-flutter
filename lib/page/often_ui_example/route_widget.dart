import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/page/often_ui_example/route_test_page.dart';

class RouteWidget extends StatefulWidget {
  @override
  _RouteWidgetState createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget> {
  GlobalKey<ScaffoldState> _globalKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/route_test_page': (_) => RouteTestPage(),
      },
      home: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(WanAndroidLocalizations.of(context).route_widget),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(_globalKey.currentContext).pushNamed('/route_test_page').then((v){
                  if (v != null) {
                    SnackBar sb = SnackBar(content: Text(v));
                    _globalKey.currentState.showSnackBar(sb);
                  }
                });
              },
              child: Text("静态跳转"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RouteTestPage();
                }));
              },
              child: Text("动态跳转"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RouteTestPage(
                    data: "111111",
                  );
                })).then((v) {
                  if (v != null) {
                    SnackBar sb = SnackBar(content: Text(v));
                    _globalKey.currentState.showSnackBar(sb);
                  }
                });
              },
              child: Text("带值跳转并接收返回值"),
            ),
          ],
        ),
      ),
    );
  }
}
