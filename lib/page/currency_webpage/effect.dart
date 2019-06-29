import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CurrencyWebViewState> buildEffect() {
  return combineEffects(<Object, Effect<CurrencyWebViewState>>{
    CurrencyWebViewAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CurrencyWebViewState> ctx) {
}
