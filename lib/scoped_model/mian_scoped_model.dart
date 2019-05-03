import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/scoped_model/theme_scoped_model.dart';

import 'language_scoped_model.dart';
import 'login_scoped_model.dart';

/*
*全局主数据模型，全局使用的数据在这里添加模型
* **/
class MainScopedModel extends Model
    with ThemeScopedModel, LanguageScopedModel, LoginScopedModel {
  static MainScopedModel of(context) =>
      ScopedModel.of<MainScopedModel>(context, rebuildOnChange: true);
}
