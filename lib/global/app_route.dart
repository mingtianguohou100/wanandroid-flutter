import 'package:fish_redux/fish_redux.dart';
import 'package:wandroid_flutter/page/app_page/page.dart';
import 'package:wandroid_flutter/page/currency_webpage/page.dart';
import 'package:wandroid_flutter/page/home_page/page.dart';
import 'package:wandroid_flutter/page/main_page/page.dart';
import 'package:wandroid_flutter/page/start_page/page.dart';
import 'package:wandroid_flutter/page/user_jurisdiction/user_pwd_login/page.dart';
import 'package:wandroid_flutter/page/user_jurisdiction/user_register/page.dart';

import 'global_fish_redux/state.dart';
import 'global_fish_redux/store.dart';

///全局路由
class AppRoute {
  static PageRoutes _pageRoutes;

  static PageRoutes get pageRoutes {
    if (_pageRoutes == null) {
      _pageRoutes = _pageRoutes = PageRoutes(
        pages: <String, Page<Object, dynamic>>{
          AppRoutePagePath.APP: AppPage(),
          AppRoutePagePath.MAIN_PAGE:MainPage(),
          AppRoutePagePath.APP_START_PAGE: StartPage(),
          AppRoutePagePath.HOME_PAGE: HomePage(),
          AppRoutePagePath.USER_PWD_LOGIN: UserPwdLoginPage(),
          AppRoutePagePath.USER_PWD_REGISTER: UserRegisterPage(),
          AppRoutePagePath.CURRENCY_WEB_VIEW: CurrencyWebViewPage(),
        },
        visitor: (String path, Page<Object, dynamic> page) {
          /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
          /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
          if (page.isTypeof<GlobalBaseState>()) {
            /// 建立 AppStore 驱动 PageStore 的单向数据连接
            /// 1. 参数1 AppStore
            /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
            page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pagestate, GlobalState appState) {
              final GlobalBaseState p = pagestate;
              if (p.themeColor != appState.themeColor) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;
                  return newState;
                }
              }

              if (p.token != appState.token) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.token = appState.token;
                  return newState;
                }
              }

              if (p.locale != appState.locale) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.locale = appState.locale;
                  return newState;
                }
              }

              return pagestate;
            });
          }

          /// AOP
          /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
          /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
          page.enhancer.append(
            /// View AOP
            viewMiddleware: <ViewMiddleware<dynamic>>[
              safetyView<dynamic>(),
            ],

            /// Adapter AOP
            adapterMiddleware: <AdapterMiddleware<dynamic>>[
              safetyAdapter<dynamic>()
            ],

            /// Effect AOP
            effectMiddleware: <EffectMiddleware<dynamic>>[
              _pageAnalyticsMiddleware<dynamic>(),
            ],

            /// Store AOP
            middleware: <Middleware<dynamic>>[
              logMiddleware<dynamic>(tag: page.runtimeType.toString()),
            ],
          );
        },
      );
    }
    return _pageRoutes;
  }
}

//Page<T, dynamic> pageConfiguration<T extends GlobalBaseState<T>>(
//    Page<T, dynamic> page) {
//  return page
//
//    ///connect with app-store
//    ..connectExtraStore(GlobalStore.store,
//        (Object pagestate, GlobalState appState) {
//      GlobalBaseState p = pagestate;
//      if ((p.themeColor == appState.themeColor) &&
//          (p.locale == appState.locale) &&
//          (p.token == appState.token)) {
//        return pagestate;
//      } else {
//        if (pagestate is Cloneable) {
//          final Object copy = pagestate.clone();
//          final GlobalBaseState newState = copy;
//          newState.themeColor = appState.themeColor;
//          newState.token = appState.token;
//          newState.locale = appState.locale;
//          return newState;
//        }
//      }
//    })
//    ..enhancer.append(
//      viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
//      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],
//      effectMiddleware: [],
//      middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
//    );
//}

class AppRoutePagePath {
  static final String APP = "app";
  static final String MAIN_PAGE = "main_page";
  static final String APP_START_PAGE = "start_page";
  static final String HOME_PAGE = "home_page";
  ///登录注册
  static final String USER_PWD_LOGIN = "user_pwd_login";
  static final String USER_PWD_REGISTER = "user_pwd_register";
  static final String CURRENCY_WEB_VIEW = "currency_web_view";
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
