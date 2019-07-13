import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/page/home_page/sideslip_page/component.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: NoneConn<HomeState>() + HomeAdapter(),
              slots: <String, Dependent<HomeState>>{
                HomeComponentName.SIDESLIP:
                    SideslipConnector() + SideslipComponent()
              }),
        );
}
