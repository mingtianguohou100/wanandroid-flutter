import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/global/global_constant.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wanandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wanandroid_flutter/global/global_theme_style.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/utils/sp_util.dart';
import 'action.dart';
import 'state.dart';
import 'package:common_utils/common_utils.dart';

Effect<AppState> buildEffect() {
  return combineEffects(<Object, Effect<AppState>>{
    Lifecycle.initState: _initState,
    AppAction.action: _onStartPage,
  });
}

///全局初始化
void _initState(Action action, Context<AppState> ctx) {
  LogUtil.init(isDebug: true, tag: "####wan_android_debug####");
  SpUtil.getInstance();
  int _globalColorIndex =
      SpUtil.getInt(GlobalConstant.LOCAL_THEME_COLOR_SP_KEY);
  String _globalInternationalization =
      SpUtil.getString(GlobalConstant.LOCAL_INTERNATIONALIZATION_SP_KEY);
  UserLoginBean _globalUserData = SpUtil.getUserInfo();

  if (_globalInternationalization.isEmpty)
    _globalInternationalization = GlobalThemeStyle.CHINESE;
  if (_globalUserData != null)
    GlobalStore.store
        .dispatch(GlobalActionCreator.changeUserData(_globalUserData));

  GlobalStore.store
      .dispatch(GlobalActionCreator.changeThemeColor(_globalColorIndex));

  GlobalStore.store.dispatch(
      GlobalActionCreator.changeLanguage(_globalInternationalization));
}

void _onStartPage(Action action, Context<AppState> ctx) {}
