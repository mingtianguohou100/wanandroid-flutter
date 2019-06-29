import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserRegisterPage extends Page<UserRegisterState, Map<String, dynamic>> {
  UserRegisterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserRegisterState>(
                adapter: null,
                slots: <String, Dependent<UserRegisterState>>{
                }),
            middleware: <Middleware<UserRegisterState>>[
            ],);

}
