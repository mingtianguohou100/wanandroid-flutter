import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:wandroid_flutter/global/global_constant.dart';
import 'package:wandroid_flutter/global/global_fish_redux/action.dart';
import 'package:wandroid_flutter/global/global_fish_redux/store.dart';
import 'package:wandroid_flutter/global/global_theme_style.dart';
import 'package:wandroid_flutter/utils/sp_util.dart';
import 'action.dart';
import 'state.dart';

Effect<AppState> buildEffect() {
  return combineEffects(<Object, Effect<AppState>>{
    Lifecycle.initState: _initState,
    AppAction.action: _onStartPage,
  });
}

///全局初始化
void _initState(Action action, Context<AppState> ctx) async {
  LogUtil.init(isDebug: true, tag: "####wan_android_debug####");
  await SpUtil.getInstance();
  int _globalColorIndex =
      SpUtil.getInt(GlobalConstant.LOCAL_THEME_COLOR_SP_KEY);
  String _globalInternationalization =
      SpUtil.getString(GlobalConstant.LOCAL_INTERNATIONALIZATION_SP_KEY);
  String _token = SpUtil.getString(GlobalConstant.LOCAL_USER_DATA_SP_KEY,defValue: null);

  if (_globalInternationalization == GlobalThemeStyle.CHINESE ||
      _globalInternationalization == GlobalThemeStyle.ENGLISH) {
    GlobalStore.store.dispatch(
        GlobalActionCreator.changeLanguage(_globalInternationalization));
  } else {
    GlobalStore.store.dispatch(GlobalActionCreator.changeLanguage(
        _globalInternationalization = GlobalThemeStyle.CHINESE));
  }

  if (_token != null) {
    GlobalStore.store
        .dispatch(GlobalActionCreator.changeUserData(_token));
  }

  GlobalStore.store
      .dispatch(GlobalActionCreator.changeThemeColor(_globalColorIndex));
}

void _onStartPage(Action action, Context<AppState> ctx) {}
