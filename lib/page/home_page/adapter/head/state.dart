import 'package:fish_redux/fish_redux.dart';
import 'package:wandroid_flutter/model/HomeHeadBannerBean.dart';

class HomeHeadState implements Cloneable<HomeHeadState> {
  List<HomeHeadBannerBean> homeBanners;

  HomeHeadState(this.homeBanners);

  @override
  HomeHeadState clone() {
    return HomeHeadState(homeBanners);
  }
}
