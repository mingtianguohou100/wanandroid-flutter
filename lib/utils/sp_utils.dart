import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';

class SpUtils {
  /**
   * 用户登陆信息
   * **/
  static void saveUserInfo(String name, String cookie) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("wanandroid_user_name", name);
      prefs.setString("wanandroid_user_cookie", cookie);
    });
  }

  static Future<UserLocation> getUserInfo() async {
    UserLocation ub;
    SharedPreferences sp = await SharedPreferences.getInstance();
    String name = sp.getString("wanandroid_user_name");
    String cookie = sp.getString("wanandroid_user_cookie");
    if (name!=null&&cookie!=null) {
      ub = UserLocation(name, cookie);
      return ub;
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
   * 主题和国际化信息
   * **/
  static void saveAppThemeData(int themeDataIndex) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt("wanandroid_theme_data", themeDataIndex);
    });
  }

  static Future<int> getAppThemeData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int themeIndex = sp.getInt("wanandroid_theme_data");
    if (themeIndex != null) {
      return themeIndex as int;
    }
    return 0;
  }

  //true=中文
  static void saveAppLanguageData(bool lanaguage) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("wanandroid_language_data", lanaguage);
    });
  }

  static Future<bool> getAppLanguageData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool language = sp.getBool("wanandroid_language_data");
    if (language != null) {
      return language as bool;
    }
    return true;
  }
}
