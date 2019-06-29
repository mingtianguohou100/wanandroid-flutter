import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';

//TODO replace with your own action
enum HomeHeadAction { onClickBanner }

class HomeHeadActionCreator {
  static Action onClickBanner(HomeHeadBannerBean hhb) {
    return Action(HomeHeadAction.onClickBanner);
  }
}
