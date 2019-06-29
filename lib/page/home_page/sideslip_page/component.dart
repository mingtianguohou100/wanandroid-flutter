import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SideslipComponent extends Component<SideslipState> {
  SideslipComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SideslipState>(
                adapter: null,
                slots: <String, Dependent<SideslipState>>{
                }),);

}
