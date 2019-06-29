import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'action.dart';
import 'db/sql_manager.dart';
import 'state.dart';

Effect<TestDataBaseState> buildEffect() {
  return combineEffects(<Object, Effect<TestDataBaseState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    TestDataBaseAction.onQueryAllTab: _onQueryAllTab,
    TestDataBaseAction.onQueryTab: _onQueryTab,
    TestDataBaseAction.onCreateTab: _onCreateTab,
    TestDataBaseAction.onDeleteTab: _onDeleteTab,
  });
}

void _initState(Action action, Context<TestDataBaseState> ctx) {
  ctx.state.globalKey = GlobalKey();
  ctx.state.textEditingController = TextEditingController();
}

void _dispose(Action action, Context<TestDataBaseState> ctx) {
  ctx.state.textEditingController.dispose();
}

///查询所有表
void _onQueryAllTab(Action action, Context<TestDataBaseState> ctx) {
  SqlManager.getAllTab().then((data) {
    ctx.dispatch(TestDataBaseActionCreator.queryAllTab(data));
  });
}

///查询指定表是否存在
void _onQueryTab(Action action, Context<TestDataBaseState> ctx) {
  String content = ctx.state.textEditingController.text;
  if (content != null && content.length > 0) {
    SqlManager.isTableExist(content).then((data) {
      ctx.dispatch(TestDataBaseActionCreator.queryTab(data));
    });
  } else {
    ctx.state.globalKey.currentState
        .showSnackBar(CommonUilt.showSnackBar(Text("请输入要查询的内容")));
  }
}

///创建表
void _onCreateTab(Action action, Context<TestDataBaseState> ctx) {
  String content = ctx.state.textEditingController.text;
  if (content != null && content.length > 0) {
    SqlManager.isTableExist(content).then((data){
      if(data){
        ctx.state.globalKey.currentState
            .showSnackBar(CommonUilt.showSnackBar(Text("表已存在")));
      }else{
        SqlManager.createTab(content, "WanandroiName)").then((data) {
          ctx.dispatch(TestDataBaseActionCreator.createTab(data));
        });
      }
    });
  } else {
    ctx.state.globalKey.currentState
        .showSnackBar(CommonUilt.showSnackBar(Text("请输入要创建的表名")));
  }
}

///删除表
void _onDeleteTab(Action action, Context<TestDataBaseState> ctx) {
  String content = ctx.state.textEditingController.text;
  if (content != null && content.length > 0) {
    SqlManager.isTableExist(content).then((data) {
      if (data) {
        SqlManager.deleteTab(content).then((data) {
          ctx.dispatch(TestDataBaseActionCreator.deleteTab(data));
        });
        ctx.state.globalKey.currentState
            .showSnackBar(CommonUilt.showSnackBar(Text("删除成功")));
      } else {
        ctx.state.globalKey.currentState
            .showSnackBar(CommonUilt.showSnackBar(Text("没有这张表")));
      }
    });
  } else {
    ctx.state.globalKey.currentState
        .showSnackBar(CommonUilt.showSnackBar(Text("请输入要删除的表名")));
  }
}
