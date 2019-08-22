import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.globalThemeColor: _changeThemeColor,
      GlobalAction.gloablLanguage: _changeLanguage,
      GlobalAction.globalUserData: _changeUserData,
    },
  );
}

GlobalState _changeThemeColor(GlobalState state, prefix0.Action action) {
  int index = action.payload;
  return state.clone()..themeColor = index;
}

GlobalState _changeLanguage(GlobalState state, prefix0.Action action) {
  String _language = action.payload;
  ///本地化选择的语言
  SpUtils.saveAppLanguage(_language);
  return state.clone()..locale = Locale(_language, "");
}

GlobalState _changeUserData(GlobalState state, prefix0.Action action) {
  UserLoginBean userData = action.payload;
  SpUtils.saveUserInfo(userData==null?"":userData.toJson().toString());
  return state.clone()..userLoginBean = userData;
}
