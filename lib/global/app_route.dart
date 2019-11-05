import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/page/app_page/page.dart';
import 'package:wanandroid_flutter/page/currency_webpage/page.dart';
import 'package:wanandroid_flutter/page/home_page/page.dart';
import 'package:wanandroid_flutter/page/start_page/page.dart';
import 'package:wanandroid_flutter/page/user_jurisdiction/user_pwd_login/page.dart';
import 'package:wanandroid_flutter/page/user_jurisdiction/user_register/page.dart';
import 'global_fish_redux/state.dart';
import 'global_fish_redux/store.dart';

///全局路由
class AppRoute {
  static PageRoutes _pageRoutes;

  static PageRoutes get pageRoutes {
    if (_pageRoutes == null) {
      _pageRoutes = _pageRoutes = PageRoutes(
        pages: <String, Page<Object, dynamic>>{
          AppRoutePagePath.APP: pageConfiguration(AppPage()),
          AppRoutePagePath.APP_START_PAGE: StartPage(),
          AppRoutePagePath.HOME_PAGE: pageConfiguration(HomePage()),
          AppRoutePagePath.USER_PWD_LOGIN: UserPwdLoginPage(),
          AppRoutePagePath.USER_PWD_REGISTER: UserRegisterPage(),
          AppRoutePagePath.CURRENCY_WEB_VIEW: CurrencyWebViewPage(),
        },
      );
    }
    return _pageRoutes;
  }
}

Page<T, dynamic> pageConfiguration<T extends GlobalBaseState<T>>(
    Page<T, dynamic> page) {
  return page

    ///connect with app-store
    ..connectExtraStore(GlobalStore.store,
        (Object pagestate, GlobalState appState) {
      GlobalBaseState p = pagestate;
      if ((p.themeColor == appState.themeColor) &&
          (p.locale == appState.locale) &&
          (p.token == appState.token)) {
        return pagestate;
      } else {
        if (pagestate is Cloneable) {
          final Object copy = pagestate.clone();
          final GlobalBaseState newState = copy;
          newState.themeColor = appState.themeColor;
          newState.token = appState.token;
          newState.locale = appState.locale;
          return newState;
        }
      }
    })
    ..enhancer.append(
      viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],
      effectMiddleware: [],
      middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
    );
}

class AppRoutePagePath {
  static final String APP = "app";
  static final String APP_START_PAGE = "start_page";
  static final String HOME_PAGE = "home_page";

  ///登录注册
  static final String USER_PWD_LOGIN = "user_pwd_login";
  static final String USER_PWD_REGISTER = "user_pwd_register";
  static final String CURRENCY_WEB_VIEW = "currency_web_view";
}
