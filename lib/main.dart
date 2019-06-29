import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';
import 'global/app_route.dart';
import 'global/global_constant.dart';
import 'global/global_fish_redux/action.dart';

void main() async {
  await SpUtils.getAppThemeData().then((data) => GlobalStore.store.dispatch(
      data != null
          ? GlobalActionCreator.changeThemeColor(data)
          : GlobalActionCreator.changeThemeColor(0)));

  await SpUtils.getAppLanguagea().then((data) => GlobalStore.store.dispatch(
      GlobalActionCreator.changeLanguage(
          data == null ? GlobalConstant.CHINESE : data)));

  await SpUtils.getUserInfo().then((data) =>
      GlobalStore.store.dispatch(GlobalActionCreator.changeUserData(data)));

  runApp(AppRoute.pageRoutes.buildPage(AppRoutePagePath.APP, null));
}
