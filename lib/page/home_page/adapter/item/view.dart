import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';
import 'action.dart';

Widget buildView(Datas state, Dispatch dispatch, ViewService viewService) {
  Datas _item = state;

  return GestureDetector(
    onTap: () => dispatch(HomeItemActionCreator.onItemClick()),
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
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(_item.author),
                      ),
                    ],
                  ),
                ),
                Text(
                  _item.niceDate,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                _item.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
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
                    _item.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    icon: Image.asset("resources/images/aixing.png",
                        color:Colors.red ),
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
