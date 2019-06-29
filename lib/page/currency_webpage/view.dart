import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CurrencyWebViewState state, Dispatch dispatch, ViewService viewService) {
  CurrencyWebViewState _currencyWebViewState = state.clone();

  return WebviewScaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(_currencyWebViewState.title != null
          ? _currencyWebViewState.title
          : ""),
    ),
    url: _currencyWebViewState.url != null ? _currencyWebViewState.url : "",
  );
}
