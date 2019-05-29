import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/page/home_page.dart';
import 'package:wanandroid_flutter/page/ks_page.dart';
import 'package:wanandroid_flutter/page/login_page.dart';
import 'package:wanandroid_flutter/scoped_model/mian_scoped_model.dart';
import 'package:wanandroid_flutter/widget/login_animation.dart';
import 'package:wanandroid_flutter/widget/search_bar_delegate.dart';
import 'package:wanandroid_flutter/widget/wanandroid_drawer_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  List<Widget> _page;
  GlobalKey<ScaffoldState> _global;
  searchBarDelegate _searchBarDelegate; //搜索的界面
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _page = [HomePage(), KsPage()];
    _global = GlobalKey<ScaffoldState>();
    _searchBarDelegate = searchBarDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: exitAppTotast,
        child: ScopedModelDescendant<MainScopedModel>(
            builder: (context, child, model) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.person),
                onPressed: () {
                  if (model.login == null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginPage();
                    }));
                  } else {
                    SnackBar sb = SnackBar(content: Text("您已登录！"));
                    _global.currentState.showSnackBar(sb);
                  }
                }),
            appBar: AppBar(
              title: Text(_index == 0
                  ? WanAndroidLocalizations.of(context).homeTitle
                  : WanAndroidLocalizations.of(context).knowledgeTitle),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: _searchBarDelegate);
                  },
                ),
              ],
            ),
            drawer: WanandroidDrawerWidget(),
            key: _global,
            body: _page[_index],
          );
        }));
  }

  /*
  * 退出APP确认提示
  ***/
  Future<bool> exitAppTotast() async {
    return showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: Text("确定退出APP吗？"),
                actions: <Widget>[
                  RaisedButton(
                    child: Text(
                      WanAndroidLocalizations.of(context).click,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  RaisedButton(
                    child: Text(WanAndroidLocalizations.of(context).cancel,
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              );
            }) ??
        Future.value(false);
  }
}
