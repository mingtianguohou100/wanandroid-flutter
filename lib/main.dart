import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global/app_route.dart';
void main() async {
  runApp(AppRoute.pageRoutes.buildPage(AppRoutePagePath.APP, null));
}
