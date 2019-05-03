import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/localization/wan_android_localiation_delegate.dart';
import 'package:wanandroid_flutter/page/start_page.dart';
import 'package:wanandroid_flutter/scoped_model/mian_scoped_model.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

import 'model/UserLocation.dart';

void main() async {
  int themeIndex = await SpUtils.getAppThemeData();
  bool language = await SpUtils.getAppLanguageData();
  UserLocation userBean = await SpUtils.getUserInfo();
  runApp(MyApp(themeIndex, language, userBean));
}

class MyApp extends StatelessWidget {
  final int _themeIndex;
  final bool _language;
  final UserLocation _userBean;

  MyApp(this._themeIndex, this._language, this._userBean);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainScopedModel>(
      model: MainScopedModel(),
      child:ScopedModelDescendant<MainScopedModel>(
          builder: (context, child, model) {
            if (_userBean != null) {
              model.setLogin(_userBean);
            }
            return MaterialApp(
              // 去除 DEBUG 标签
//            debugShowCheckedModeBanner: false,
              locale: model.language != null
                  ? (model.language
                  ? const Locale('zh', 'CH')
                  : const Locale('en', 'US'))
                  : (_language
                  ? const Locale('zh', 'CH')
                  : const Locale('en', 'US')),
              home: StartPage(),
              theme: ThemeData(
                  platform: TargetPlatform.iOS,
                  primaryColor: GlobalBlocState.instance.themeList[
                  model.themeIndex != null ? model.themeIndex : _themeIndex]),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DemoLocalizationsDelegate.delegate,
              ],
              supportedLocales: [
                const Locale('zh', 'CH'),
                const Locale('en', 'US')
              ],
            );
          }),
    );
  }





}
