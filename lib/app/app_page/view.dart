import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wandroid_flutter/app/global_constant/global_theme_style.dart';
import 'package:wandroid_flutter/generated/i18n.dart';
import '../app_route.dart';
import 'state.dart';

Widget buildView(AppState state, Dispatch dispatch, ViewService viewService) {
  AppState _appState = state.clone();
  return MaterialApp(
    // 去除 DEBUG 标签
//    debugShowCheckedModeBanner: true,
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: _appState.locale != null
        ? _appState.locale
        : Locale(GlobalThemeStyle.CHINESE, ""),
    supportedLocales: S.delegate.supportedLocales,
    theme: ThemeData(
        platform: TargetPlatform.iOS,
        //主题色    应用程序主要部分的背景颜色(toolbars、tab bars 等)
        primaryColor: _appState.themeColor != null
            ? GlobalThemeStyle.themeList[_appState.themeColor]
            : GlobalThemeStyle.themeList[0],
         textTheme: TextTheme(
        //设置Material的默认字体样式
        bodyText1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
      ),
    ),
    home: AppRoute.pageRoutes.buildPage(AppRoutePagePath.APP_START_PAGE, null),
    onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<Object>(
        builder: (BuildContext context) =>
            AppRoute.pageRoutes.buildPage(settings.name, settings.arguments)),
  );
}
