import 'package:fish_redux/fish_redux.dart';
import 'package:wandroid_flutter/model/HomeInfomationBean.dart';

import 'action.dart';

Reducer<Datas> buildReducer() {
  return asReducer(
    <Object, Reducer<Datas>>{
    },
  );
}

//Datas _checkShowTopWidget(Datas state, Action action) {
//  state.isLike = !state.isLike;
//  return state;
//}
