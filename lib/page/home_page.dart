import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/model/HomeBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeWzListBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/scoped_model/home_scoped_model.dart';
import 'package:wanandroid_flutter/widget/my_web_page.dart';
import 'package:wanandroid_flutter/widget/network_loading_widget.dart';
import 'package:banner/banner.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  HomeScopedModel _homeScopedModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeScopedModel = HomeScopedModel();
    _scrollController = ScrollController();
    _homeScopedModel.requestRefreshData();

  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeScopedModel>(
      model: _homeScopedModel,
      child: ScopedModelDescendant<HomeScopedModel>(
        builder: (context, child, model) {
          return (model.homeWzlistdata == null && model.homeBanner == null)
              ? NetworkLoadingWidget()
              : RefreshIndicator(
                  color: Theme.of(context).primaryColor,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: model.homeWzlistdata == null
                        ? 0
                        : model.homeWzlistdata.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (model.homeBanner != null && index == 0) {
                        return createBanner(
                            model.homeBanner[index], model.homeBanner);
                      }
                      if (index == model.homeWzlistdata.length) {
                        return createMoreStyle();
                      } else {
                        return createItem(model.homeWzlistdata[index]);
                      }
                    },
                  ),
                  onRefresh: model.requestRefreshData,
                );
        },
      ),
    );
  }

  /*
  * 加载更多的样式
  * **/
  Widget createMoreStyle() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: GestureDetector(
          child: Text(WanAndroidLocalizations.of(context).net_work_loading),
          onTap: () {
            _homeScopedModel.requestMoreData();
          },
        )),
      ),
    );
  }

  /*
  * 首页列表的banner
  * **/
  Widget createBanner(
      HomeBannerItemModel items, List<HomeBannerItemModel> homeBanner) {
    return Card(
      elevation: 5.0,
      child:  BannerView(
        onBannerClickListener: (index,data){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return MyWebPage(data.title, data.url);
          }));
        },
        delayTime: 5,
        data: homeBanner == null ? 0 : homeBanner,
        buildShowView: (index, data) {
          return Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Image.network(
                (data as HomeBannerItemModel).imagePath,
                width: MediaQueryData.fromWindow(ui.window).size.width, //屏幕的宽
                fit: BoxFit.fitWidth,
              ),
              Stack(
                children: <Widget>[
                  Opacity(
                      opacity: 0.1,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        height: 35.0,
                      )),
                  Container(
                    child: Text(
                      (data as HomeBannerItemModel).title,
                      style: TextStyle(color: Colors.white),
                    ),
                    margin: const EdgeInsets.only(left: 10.0),
                  ),
                ],
                alignment: Alignment.centerLeft,
              ),
            ],
          );
        },
//      onBannerClickListener: (index, data) {
//        print(index);
//      },
      ),
    );
  }

  /*
  * 首页item
  * **/
  Widget createItem(Datas items) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return MyWebPage(items.title, items.link);
        }));
      },
      child: Card(
        elevation: 10.0, //高度
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ), //图形边框
        margin: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "resources/images/android.png",
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: Text(items.author),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    items.niceDate,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  items.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15.0),
                ),
                margin: const EdgeInsets.only(top: 10.0),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      items.author,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Listener(
                      child: Image.asset("resources/images/aixing.png",
                          color: items.collect
                              ? Theme.of(context).primaryColor
                              : Colors.red),
                      onPointerDown: (pue) {
//                        SpUtils.getUserInfo((name, cookie) {
//                          if (name != null && cookie != null) {
//                            Navigator.of(context).push(MaterialPageRoute(
//                                builder: (BuildContext context) {
//                              return LoginPage();
//                            }));
//                          } else {
//                            CommonService.instance.getAddCollect(
//                                items.id, (String data) {},
//                                onErro: (e) {});
//                          }
//                        }, (e) {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
