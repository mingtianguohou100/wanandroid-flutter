import 'package:fish_redux/fish_redux.dart';
import 'package:wanandroid_flutter/model/HomeInfomationBean.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class HomeItemComponent extends Component<Datas> {
  HomeItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
        );
}
