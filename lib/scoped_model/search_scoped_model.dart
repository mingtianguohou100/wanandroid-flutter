import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/model/HomeWzListBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';

class SearchScopedModel extends Model {
  List<Datas> _homeWzlistdata;


  List<Datas> get homeWzlistdata => _homeWzlistdata;

  Future<Null> requestRefreshData(String searchTxt) async {
    CommonService.instance.getSearData({
      "page": 0,
      "k": searchTxt,
    }, (data) {
      if (_homeWzlistdata != null) {
        _homeWzlistdata.clear();
      }
      _homeWzlistdata = data;
      notifyListeners();
    }, onErro: (e) {});

  }

  static SearchScopedModel of(context) =>
      ScopedModel.of<SearchScopedModel>(context, rebuildOnChange: true);
}
