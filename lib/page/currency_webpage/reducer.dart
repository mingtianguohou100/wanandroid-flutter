import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CurrencyWebViewState> buildReducer() {
  return asReducer(
    <Object, Reducer<CurrencyWebViewState>>{
      CurrencyWebViewAction.action: _onAction,
    },
  );
}

CurrencyWebViewState _onAction(CurrencyWebViewState state, Action action) {
  final CurrencyWebViewState newState = state.clone();
  return newState;
}
