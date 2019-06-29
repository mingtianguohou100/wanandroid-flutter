import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'db/sql_manager.dart';
import 'state.dart';

Reducer<TestDataBaseState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestDataBaseState>>{
      TestDataBaseAction.queryAllTab: _queryAllTab,
      TestDataBaseAction.queryTab: _queryTab,
      TestDataBaseAction.createTab: _createTab,
      TestDataBaseAction.deleteTab: _deleteTab,
  },
  );
}

///查询所有表
TestDataBaseState _queryAllTab(TestDataBaseState state, Action action) {
  final TestDataBaseState newState = state.clone();
  newState.content=action.payload.toString();
  return newState;
}

///查询指定表是否存在
TestDataBaseState _queryTab(TestDataBaseState state, Action action) {
  final TestDataBaseState newState = state.clone();
  newState.content=action.payload.toString();
  return newState;
}

///创建表
TestDataBaseState _createTab(TestDataBaseState state, Action action) {
  final TestDataBaseState newState = state.clone();
  newState.content="创建成功";
  return newState;
}

///删除表
TestDataBaseState _deleteTab(TestDataBaseState state, Action action) {
  final TestDataBaseState newState = state.clone();
  newState.content=action.payload;
  return newState;
}