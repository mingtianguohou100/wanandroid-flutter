import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/page/likes_page.dart';
import 'package:wanandroid_flutter/page/login_page.dart';
import 'package:wanandroid_flutter/page/often_ui_example/often_ui_widget.dart';
import 'package:wanandroid_flutter/scoped_model/mian_scoped_model.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

import 'my_web_page.dart';

class WanandroidDrawerWidget extends StatefulWidget {
  @override
  _WanandroidDrawerWidgetState createState() => _WanandroidDrawerWidgetState();
}

class _WanandroidDrawerWidgetState extends State<WanandroidDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: WanandroidDrawerItem(),
      ),
    ));
  }
}

class WanandroidDrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainScopedModel>(
        builder: (context, child, model) {
      return Column(
        children: <Widget>[
          createDrawerHead(model, context),

//        createDrawerTile(
//            WanAndroidLocalizations.of(context).my_likes, Icons.favorite, () {
//          SpUtils.getUserInfo((name, cookie) {
//            if (name == null) {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (BuildContext context) {
//                return LoginPage();
//              }));
//            } else {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (BuildContext context) {
//                return LikesPage();
//              }));
//            }
//          }, (e) {});
//        }),
          createDrawerTile(
              WanAndroidLocalizations.of(context).oftenUiWidget, Icons.star,
              () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return OftenUiWidget();
            }));
          }),
          createDrawerTile(WanAndroidLocalizations.of(context).switch_theme,
              Icons.signal_wifi_4_bar, () {
            switchTheme(context);
          }),
          createDrawerTile(
              WanAndroidLocalizations.of(context).switch_language, Icons.face,
              () {
            switchLag(context);
          }),
          createDrawerTile(
              WanAndroidLocalizations.of(context).about_author, Icons.person,
              () {
            createAbout(context);
          }),
          Container(
            child: Offstage(
              offstage: model.login != null ? false : true,
              child: RaisedButton(
                onPressed: () {
                  logOut(context);
                },
                color: Colors.red,
                child: Text(
                  WanAndroidLocalizations.of(context).out_login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            margin: const EdgeInsets.only(top: 40.0),
          ),
        ],
      );
    });
  }

  /*
  * drawer头部
  * **/
  Widget createDrawerHead(MainScopedModel model, BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: FlatButton(
          onPressed: () {
            model.login == null
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                    return LoginPage();
                  }))
                : null;
          },
          child: Text(
            model.login == null
                ? WanAndroidLocalizations.of(context).click_login
                : model.login.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          )),
      currentAccountPicture: CircleAvatar(
        backgroundImage: model.login == null
            ? AssetImage("resources/images/my_flutter_logo_false.png")
            : AssetImage("resources/images/my_flutter_logo_true.png"),
      ),
    );
  }

  Widget createDrawerTile(
      String pTitle, IconData pIcon, GestureTapCallback pGtc) {
    return ListTile(
      selected: true,
      title: Text(
        pTitle,
        style: TextStyle(color: Colors.black),
      ),
      leading: Icon(
        pIcon,
      ),
      onTap: pGtc,
    );
  }

  /*
  * 切换主题
  * **/
  void switchTheme(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              createThemeItem(context, 0),
              createThemeItem(context, 1),
              createThemeItem(context, 2),
              createThemeItem(context, 3),
              createThemeItem(context, 4),
              createThemeItem(context, 5),
              createThemeItem(context, 6),
              createThemeItem(context, 7),
              createThemeItem(context, 8),
              createThemeItem(context, 9),
              createThemeItem(context, 10),
              createThemeItem(context, 11),
            ],
          );
        });
  }

  Widget createThemeItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        MainScopedModel.of(context).changeTheme(position);
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: GlobalBlocState.instance.themeList[position],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  /*
  * 切换语言
  * **/
  void switchLag(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              createLagItem("中文", () {
                MainScopedModel.of(context).changeLanguage(true);
                Navigator.of(context).pop();
              }),
              createLagItem("English", () {
                MainScopedModel.of(context).changeLanguage(false);
                Navigator.of(context).pop();
              }),
            ],
          );
        });
  }

  Widget createLagItem(String text, GestureTapCallback gtc) {
    return ListTile(
      onTap: gtc,
      title: Text(text),
    );
  }

  /*
  * 关于我们
  * **/
  void createAbout(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: "flutter学习交流",
            applicationVersion: "1.0.0",
            applicationIcon: CircleAvatar(
              backgroundImage:
                  AssetImage("resources/images/my_flutter_logo_false.png"),
            ),
            applicationLegalese: "用于Flutter学习交流",
            children: <Widget>[
              ListTile(
                selected: true,
                title: Text("正儿八经小青年"),
                leading: Icon(
                  Icons.person,
                ),
              ),
              ListTile(
                selected: true,
                title: Text("接口数据来自wanadroid开源Api"),
                leading: Icon(
                  Icons.people,
                ),
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    "作者github:",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyWebPage(
                            "作者github", "https://github.com/mingtianguohou100");
                      }));
                    },
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          "https://github.com/mingtianguohou100",
                          style: TextStyle(color: Colors.blue, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      "作者博客:",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MyWebPage("作者博客",
                              "https://blog.csdn.net/mingtianguohou100");
                        }));
                      },
                      child: Wrap(
                        children: <Widget>[
                          Text(
                            "https://blog.csdn.net/mingtianguohou100",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

/*
  * 退出登录
  * **/
  void logOut(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Text(WanAndroidLocalizations.of(context).isLoginOut),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                WanAndroidLocalizations.of(context).cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                CommonService.instance.getLogOut((data) {
                  MainScopedModel.of(context).outLogin();
                  Navigator.of(context).pop();
                  MainScopedModel.of(context).changeLogin(null, null);
                }, onErro: (e) {
                  Scaffold.of(context)
                      .showSnackBar(CommonUilt.myShowSnackBar(e));
                });
              },
              child: Text(
                WanAndroidLocalizations.of(context).click,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
