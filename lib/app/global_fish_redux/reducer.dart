import 'package:fish_redux/fish_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandroid_flutter/app/global_constant/global_constant.dart';
import 'package:wandroid_flutter/utils/sp_util.dart';
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
  SpUtil.putInt(GlobalConstant.LOCAL_THEME_COLOR_SP_KEY, index);
  return state.clone()..themeColor = index;
}

GlobalState _changeLanguage(GlobalState state, prefix0.Action action) {
  String _language = action.payload;
  SpUtil.putString(GlobalConstant.LOCAL_INTERNATIONALIZATION_SP_KEY, _language);
  return state.clone()..locale = Locale(_language, "");
}

GlobalState _changeUserData(GlobalState state, prefix0.Action action) {
  String _token = action.payload;
  SpUtil.putString(GlobalConstant.LOCAL_USER_DATA_SP_KEY, _token);
  return state.clone()..token = _token;
}
