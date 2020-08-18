import 'package:fish_redux/fish_redux.dart';
import 'package:wandroid_flutter/model/HomeInfomationBean.dart';
import '../state.dart';
import 'head/component.dart';
import 'head/state.dart';
import 'item/component.dart';

class HomeAdapter extends StaticFlowAdapter<HomeState> {
  HomeAdapter()
      : super(
          slots: <Dependent<HomeState>>[
            _HomeHeadConnector() + HomeHeadComponent(),
            _HomeItemConnector() + HomeItemAdapter(),
          ],
        );
}

class _HomeHeadConnector extends ConnOp<HomeState, HomeHeadState> {
  get(HomeState homeState) => HomeHeadState(homeState.homeBanners);
}

class _HomeItemConnector extends ConnOp<HomeState, HomeState> {
  get(HomeState homeState) => homeState;

  set(HomeState homeState, HomeState subState);
}

class HomeItemAdapter extends DynamicFlowAdapter<HomeState> {
  HomeItemAdapter()
      : super(
          pool: <String, Component<Object>>{
            "item": HomeItemComponent(),
          },
          connector: _HomeItemAdapterConnector(),
        );
}

class _HomeItemAdapterConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  get(HomeState state) => state.homeItems != null
      ? state.homeItems
          .map<ItemBean>((Datas item) => ItemBean("item", item))
          .toList()
      : <ItemBean>[];

  @override
  set(HomeState state, List<ItemBean> items){
    state.homeItems = List<Datas>.from(
    items.map<String>((ItemBean bean) => bean.data).toList());
  }

}
