import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestRouteOnePage extends Page<TestRouteOneState, Map<String, dynamic>> {
  TestRouteOnePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestRouteOneState>(
                adapter: null,
                slots: <String, Dependent<TestRouteOneState>>{
                }),
            middleware: <Middleware<TestRouteOneState>>[
            ],);

}
