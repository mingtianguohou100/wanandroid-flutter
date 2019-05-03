import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

/**
* 全局主题切换
***/
abstract class ThemeScopedModel extends Model {
  int _themeIndex;

  get themeIndex => _themeIndex;

  void changeTheme(int themeIndex) async {
    _themeIndex = themeIndex;
    SpUtils.saveAppThemeData(themeIndex);
    notifyListeners();
  }


}
