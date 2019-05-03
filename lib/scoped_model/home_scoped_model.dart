import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/model/HomeBannerBean.dart';
import 'package:wanandroid_flutter/model/HomeWzListBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';

class HomeScopedModel extends Model {
  List<Datas> _homeWzlistdata;
  List<HomeBannerItemModel> _homeBanner;
  int _morePage = 0;

  List<Datas> get homeWzlistdata => _homeWzlistdata;

  List<HomeBannerItemModel> get homeBanner => _homeBanner;

  /*
  * 刷新数据
  * **/
  Future<Null> requestRefreshData() async {
    _morePage = 0;
    CommonService.instance.getHomeBannerData((data) {
      if (_homeBanner != null) {
        _homeBanner.clear();
      }
      _homeBanner = data;
      CommonService.instance.getHomeWzList((data) {
        if (_homeWzlistdata != null) {
          _homeWzlistdata.clear();
        }
        _homeWzlistdata = data;
        notifyListeners();
      }, onErro: (e) {});
    }, onErro: (e) {});
  }

  /*
    * 加载更多
    * **/
   requestMoreData() async {
    _morePage++;
    CommonService.instance.getHomeWzList((data) {
      _homeWzlistdata.addAll(data);
    }, onErro: (e) {
      if (_morePage > 0) {
        _morePage--;
      }
    }, page: _morePage);

    notifyListeners();
  }

  static HomeScopedModel of(context) =>
      ScopedModel.of<HomeScopedModel>(context, rebuildOnChange: true);
}
