import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestDataBasePage extends Page<TestDataBaseState, Map<String, dynamic>> {
  TestDataBasePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestDataBaseState>(
                adapter: null,
                slots: <String, Dependent<TestDataBaseState>>{
                }),
            middleware: <Middleware<TestDataBaseState>>[
            ],);

}
