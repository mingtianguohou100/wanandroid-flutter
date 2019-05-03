import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

/**
 * 全局语言切换
 ***/
abstract class LanguageScopedModel extends Model {
  bool _language;

  get language => _language;

  void changeLanguage(bool language) async {
    _language = language;
    notifyListeners();
    SpUtils.saveAppLanguageData(language);
  }
}
