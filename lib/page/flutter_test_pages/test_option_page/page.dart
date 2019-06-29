import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestOptionPage extends Page<TestOptionState, Map<String, dynamic>> {
  TestOptionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TestOptionState>(
                adapter: null,
                slots: <String, Dependent<TestOptionState>>{
                }),
            middleware: <Middleware<TestOptionState>>[
            ],);

}
