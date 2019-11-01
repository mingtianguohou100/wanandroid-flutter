import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'package:wanandroid_flutter/generated/i18n.dart';
import 'package:wanandroid_flutter/global/app_route.dart';
import 'package:wanandroid_flutter/global/global_theme_style.dart';
import 'state.dart';

Widget buildView(AppState state, Dispatch dispatch, ViewService viewService) {
  AppState _appState = state.clone();

  return MaterialApp(
    // 去除 DEBUG 标签
    debugShowCheckedModeBanner: true,
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: _appState.locale,
    supportedLocales: S.delegate.supportedLocales,
    theme: ThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: GlobalThemeStyle.themeList[_appState.themeColor]),
    home: AppRoute.pageRoutes.buildPage(AppRoutePagePath.APP_START_PAGE, null),
    onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<Object>(
        builder: (BuildContext context) =>
            AppRoute.pageRoutes.buildPage(settings.name, settings.arguments)),
  );
}
