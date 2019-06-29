import 'package:fish_redux/fish_redux.dart';

class CurrencyWebViewState implements Cloneable<CurrencyWebViewState> {
  String title;
  String url;

  @override
  CurrencyWebViewState clone() {
    return CurrencyWebViewState()
      ..title = title
      ..url = url;
  }
}

CurrencyWebViewState initState(Map<String, dynamic> args) {
  CurrencyWebViewState _currencyWebViewState = CurrencyWebViewState()
    ..title = args["title"]
    ..url = args["url"];
  return _currencyWebViewState;
}
