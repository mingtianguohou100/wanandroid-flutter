import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/scoped_model/mian_scoped_model.dart';

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<WanAndroidLocalizations> {

  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<WanAndroidLocalizations> load(Locale locale) {
    return new SynchronousFuture<WanAndroidLocalizations>(
        WanAndroidLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<WanAndroidLocalizations> old) {
    return false;
  }

  static DemoLocalizationsDelegate delegate = const DemoLocalizationsDelegate();
}
