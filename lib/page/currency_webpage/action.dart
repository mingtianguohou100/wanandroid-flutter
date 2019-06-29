import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CurrencyWebViewAction { action }

class CurrencyWebViewActionCreator {
  static Action onAction() {
    return const Action(CurrencyWebViewAction.action);
  }
}
