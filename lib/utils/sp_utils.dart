import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';

class SpUtils {
  /**
   * 用户登陆信息
   * **/
  static void saveUserInfo(String userLoginBeanJson) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(GlobalConstant.LOCAL_USER_DATA_KEY, userLoginBeanJson);
    });
  }

  static Future<UserLoginBean> getUserInfo() async {
    UserLoginBean ub;
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userLoginBeanJson = sp.getString(GlobalConstant.LOCAL_USER_DATA_KEY);
    if (userLoginBeanJson != null&&userLoginBeanJson!="") {
      try {
        ub = UserLoginBean.fromJson(json.decode(userLoginBeanJson));
      } catch (e) {
      }
    }
    return ub;
  }

  static void clearUserInfo() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("wanandroid_user_name");
      prefs.remove("wanandroid_user_cookie");
    });
  }

  /**
   * 主题
   * **/
  static void saveAppThemeData(int themeDataIndex) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(GlobalConstant.LOCAL_THEME_KEY, themeDataIndex);
    });
  }

  static Future<int> getAppThemeData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(GlobalConstant.LOCAL_THEME_KEY);
  }

  /**
   * 国际化
   * **/
  static void saveAppLanguage(String lanaguage) async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(GlobalConstant.LOCAL_INTEMATIONALIZATION_KEY, lanaguage);
    });
  }

  static Future<String> getAppLanguagea() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(GlobalConstant.LOCAL_INTEMATIONALIZATION_KEY);
  }
}
