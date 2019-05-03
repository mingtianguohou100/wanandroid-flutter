import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/model/HomeWzListBean.dart';
import 'package:wanandroid_flutter/scoped_model/search_scoped_model.dart';

import 'my_web_page.dart';

/*
* flutter自带的搜索控件
* **/
class searchBarDelegate extends SearchDelegate<String> {
  SearchScopedModel _searchScopedModel;

  //显示为搜索框右边的图标按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    if (query.isEmpty) {
      return null;
    } else {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
        ),
      ];
    }
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return createWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   return createWidget();
  }

  Widget createWidget(){
    if (!query.isEmpty) {
      _searchScopedModel.requestRefreshData(query);
      return ScopedModel<SearchScopedModel>(
        model: _searchScopedModel,
        child: ScopedModelDescendant<SearchScopedModel>(
            builder: (context, child, model) {
              return ListView.builder(
                itemCount:
                model.homeWzlistdata == null ? 0 : model.homeWzlistdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return createItem(model.homeWzlistdata[index], context);
                },
              );
            }),
      );
    } else {
      return Center(
          child: Row(
              children: <Widget>[
                Image.asset("resources/images/aixing.png", color: Colors.red),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("开始搜索吧!"),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center));
    }
  }

  searchBarDelegate() {
    _searchScopedModel = new SearchScopedModel();
  }

  /*
  * 首页item
  * **/
  Widget createItem(Datas items, BuildContext context) {
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
                      onPointerDown: (pue) {},
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
