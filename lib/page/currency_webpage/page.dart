import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CurrencyWebViewPage extends Page<CurrencyWebViewState, Map<String, dynamic>> {
  CurrencyWebViewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CurrencyWebViewState>(
                adapter: null,
                slots: <String, Dependent<CurrencyWebViewState>>{
                }),
            middleware: <Middleware<CurrencyWebViewState>>[
            ],);

}
