import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeHeadComponent extends Component<HomeHeadState> {
  HomeHeadComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeHeadState>(
                adapter: null,
                slots: <String, Dependent<HomeHeadState>>{
                }),);

}
