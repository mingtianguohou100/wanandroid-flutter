import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeItemAction { onItemClick,}

class HomeItemActionCreator {
  static Action onItemClick() {
    return const Action(HomeItemAction.onItemClick);
  }


}
