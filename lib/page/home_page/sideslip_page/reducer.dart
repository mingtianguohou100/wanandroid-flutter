import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';

import 'action.dart';
import 'state.dart';

Reducer<SideslipState> buildReducer() {
  return asReducer(
    <Object, Reducer<SideslipState>>{
    },
  );
}
