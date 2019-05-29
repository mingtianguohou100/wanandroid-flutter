import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  GlobalKey<ScaffoldState> _global;
  String _popuMenuVlue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _global = GlobalKey();
    _popuMenuVlue = "popumenu";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _global,
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).dialog_widget),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: createPopuMenu(context),
          ),
          RaisedButton(
            child: Text("简单的dialog"),
            onPressed: () {
              createSimpleDialog(context);
            },
          ),
          RaisedButton(
            child: Text("常用的dialog"),
            onPressed: () {
              createAlDialog(context);
            },
          ),

    Card(child:Padding(padding: EdgeInsets.all(10.0),child: Text("asdasd"),),elevation: 50.0,borderOnForeground:false,clipBehavior:Clip.none)
    ],
      ),
    );
  }

  Widget createPopuMenu(BuildContext context) {
    return PopupMenuButton(
      child: Text(_popuMenuVlue),
      itemBuilder: (BuildContext bc) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              child: ListTile(
                onTap: () {
                  setState(() {
                    _popuMenuVlue = "one";
                    Navigator.of(context).pop();
                  });
                },
                leading: Icon(Icons.school),
                title: Text("one"),
              ),
            ),
            PopupMenuItem<String>(
              child: ListTile(
                onTap: () {
                  setState(() {
                    _popuMenuVlue = "two";
                    Navigator.of(context).pop();
                  });
                },
                leading: Icon(Icons.school),
                title: Text("two"),
              ),
            ),
          ],
    );
  }

  /*
  * 简单的dialog
  * **/
  void createSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return SimpleDialog(
            title: Text("简单的dialog"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("one"),
                onPressed: () {
                  SnackBar sb = SnackBar(content: Text("one"));
                  _global.currentState.showSnackBar(sb);
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Text("two"),
                onPressed: () {
                  SnackBar sb = SnackBar(content: Text("two"));
                  _global.currentState.showSnackBar(sb);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  /*
  * 常用dialog
  * **/
  void createAlDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: Text("常用的dialog"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("flutter is good"),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  WanAndroidLocalizations.of(context).click,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text(
                  WanAndroidLocalizations.of(context).cancel,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
