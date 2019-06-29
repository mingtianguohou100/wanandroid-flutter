import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.initData: _initData,
      HomeAction.checkShowTopWidget: _checkShowTopWidget,
      HomeAction.refreshData: _refreshDate,
      HomeAction.moreData: _moreData,
    },
  );
}

HomeState _initData(HomeState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final HomeState newState = state.clone();
  newState.homeItems = tuple2.i0;
  newState.homeBanners = tuple2.i1;
  return newState;
}

HomeState _checkShowTopWidget(HomeState state, Action action) {
  HomeState _homeState = state.clone();
  double _offset = action.payload;
  _offset >= HomeComponentName.HOMELIST_OFFSET_DATA
      ? _homeState.isShowTopWiget = true
      : _homeState.isShowTopWiget = false;
  return _homeState;
}

HomeState _refreshDate(HomeState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final HomeState newState = state.clone();
  newState.morePage = 1;
  newState.homeItems = tuple2.i0;
  newState.homeBanners = tuple2.i1;
  return newState;
}

HomeState _moreData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.morePage++;
  newState.homeItems.addAll(action.payload);
  return newState;
}
