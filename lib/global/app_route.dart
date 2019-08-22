import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/page/app_page/page.dart';
import 'package:wanandroid_flutter/page/currency_webpage/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_data_base_page/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_option_page/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_route_pages/test_route_one/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_route_pages/test_route_page/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_route_pages/test_route_thread/page.dart';
import 'package:wanandroid_flutter/page/flutter_test_pages/test_route_pages/test_route_two/page.dart';
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

          ///testWIdget
          AppRoutePagePath.TEST_OPTION: TestOptionPage(),
          AppRoutePagePath.TEST_DATA_BASE: TestDataBasePage(),
          AppRoutePagePath.TEST_ROUTE: TestRoutePage(),
          AppRoutePagePath.TEST_ROUTE_ONE: TestRouteOnePage(),
          AppRoutePagePath.TEST_ROUTE_TWO: TestRouteTwoPage(),
          AppRoutePagePath.TEST_ROUTE_THREAD: TestRouteThreadPage(),
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
          (p.userLoginBean == appState.userLoginBean)) {
        return pagestate;
      } else {
        if (pagestate is Cloneable) {
          final Object copy = pagestate.clone();
          final GlobalBaseState newState = copy;
          newState.themeColor = appState.themeColor;
          newState.userLoginBean = appState.userLoginBean;
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

  ///testWidget
  static final String TEST_OPTION = "test_option";

  ///数据库
  static final String TEST_DATA_BASE = "test_data_base";

  ///路由
  static final String TEST_ROUTE = "test_route";

  //路由测试界面
  static final String TEST_ROUTE_ONE = "test_route_one";
  static final String TEST_ROUTE_TWO = "test_route_two";
  static final String TEST_ROUTE_THREAD = "test_route_thread";

  static final String CURRENCY_WEB_VIEW = "currency_web_view";
}
