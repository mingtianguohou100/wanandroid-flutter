import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestRouteTwoPage extends Page<TestRouteTwoState, Map<String, dynamic>> {
  TestRouteTwoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestRouteTwoState>(
                adapter: null,
                slots: <String, Dependent<TestRouteTwoState>>{
                }),
            middleware: <Middleware<TestRouteTwoState>>[
            ],);

}
