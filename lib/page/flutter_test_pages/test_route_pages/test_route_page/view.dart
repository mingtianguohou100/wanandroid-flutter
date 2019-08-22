import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../../../generated/i18n.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    TestRouteState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(S.of(viewService.context).route_widget),
    ),
  );
}
