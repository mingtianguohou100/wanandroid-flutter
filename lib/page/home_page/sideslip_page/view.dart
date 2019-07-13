import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/widget/my_web_page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    SideslipState state, Dispatch dispatch, ViewService viewService) {
  SideslipState _sideslipState = state.clone();
  UserLoginBean _userLocation = _sideslipState.userLoginBean;
  BuildContext _context = viewService.context;
  S _i18nS = S.of(_context);
  /*
  * drawer头部，个人登录信息
  * **/
  Widget createDrawerHead() {
    return UserAccountsDrawerHeader(
      accountName: FlatButton(
          onPressed: () => _userLocation == null
              ? dispatch(SideslipActionCreator.onLogin())
              : null,
          child: Text(
            _userLocation == null
                ? S.of(_context).click_login
                : _userLocation.username,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          )),
      currentAccountPicture: CircleAvatar(
        backgroundImage: _userLocation == null
            ? AssetImage("resources/images/my_flutter_logo_false.png")
            : AssetImage("resources/images/my_flutter_logo_true.png"),
      ),
    );
  }

  Widget createThemeItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () => dispatch(SideslipActionCreator.changeThemeColor(position)),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: GlobalConstant.themeList[position],
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
    List<Widget> items = new List();
    for (int i = 0; i < GlobalConstant.themeList.length; i++) {
      items.add(createThemeItem(context, i));
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: items,
          );
        });
  }

  Widget createLagItem(String text, var gtc) {
    return ListTile(
      onTap: () {
        dispatch(gtc);
      },
      title: Text(text),
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
              createLagItem("中文",
                  SideslipActionCreator.changeLanguage(GlobalConstant.CHINESE)),
              createLagItem("English",
                  SideslipActionCreator.changeLanguage(GlobalConstant.ENGLISH)),
            ],
          );
        });
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

  void showLogOutDialog() {
    showDialog(
        context: _context,
        child: AlertDialog(
          content: Text(_i18nS.isLoginOut),
          actions: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(_context).pop(),
              child: Text(
                _i18nS.cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(viewService.context).pop();
                dispatch(SideslipActionCreator.onLoginOut());
              },
              child: Text(
                _i18nS.click,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  return Drawer(
      child: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Container(
      child: Column(
        children: <Widget>[
          createDrawerHead(),
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
//              createDrawerTile(_i18nS.often_ui_widget, Icons.star,
//                      () {
//                    dispatch(SideslipActionCreator.onJumpTestOption());
//                  }),

          createDrawerTile(_i18nS.switch_theme, Icons.signal_wifi_4_bar, () {
            switchTheme(viewService.context);
          }),
          createDrawerTile(_i18nS.switch_language, Icons.face, () {
            switchLag(viewService.context);
          }),
          createDrawerTile(_i18nS.about_author, Icons.person, () {
            createAbout(viewService.context);
          }),
          Container(
            child: Offstage(
              offstage: _userLocation == null ? true : false,
              child: RaisedButton(
                onPressed: () => showLogOutDialog(),
                color: Colors.red,
                child: Text(
                  _i18nS.out_login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            margin: const EdgeInsets.only(top: 40.0),
          ),
        ],
      ),
    ),
  ));
}