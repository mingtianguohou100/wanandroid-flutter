import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserPwdLoginPage extends Page<UserPwdLoginState, Map<String, dynamic>> {
  UserPwdLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserPwdLoginState>(
                adapter: null,
                slots: <String, Dependent<UserPwdLoginState>>{
                }),
            middleware: <Middleware<UserPwdLoginState>>[
            ],);

}
