import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestRoutePage extends Page<TestRouteState, Map<String, dynamic>> {
  TestRoutePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestRouteState>(
                adapter: null,
                slots: <String, Dependent<TestRouteState>>{
                }),
            middleware: <Middleware<TestRouteState>>[
            ],);

}
