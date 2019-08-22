import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestRouteThreadPage extends Page<TestRouteThreadState, Map<String, dynamic>> {
  TestRouteThreadPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestRouteThreadState>(
                adapter: null,
                slots: <String, Dependent<TestRouteThreadState>>{
                }),
            middleware: <Middleware<TestRouteThreadState>>[
            ],);

}
