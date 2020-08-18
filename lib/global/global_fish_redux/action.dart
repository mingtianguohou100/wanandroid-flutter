import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction {globalThemeColor, gloablLanguage ,globalUserData}

class GlobalActionCreator {

  static Action  changeThemeColor(int themeColorIndex) {
    return Action(GlobalAction.globalThemeColor, payload: themeColorIndex);
  }

  static Action changeLanguage(String language) {
    return  Action(GlobalAction.gloablLanguage,payload:language);
  }

  static Action changeUserData(String token) {
    return  Action(GlobalAction.globalUserData,payload:token);
  }

}
