import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StartAction {pageview_slide_listner,onClickHome}

class StartActionCreator {
  static Action pageview_listner(int index) {
    return  Action(StartAction.pageview_slide_listner,payload: index);
  }
  static Action onHome() {
    return const Action(StartAction.onClickHome);
  }
}
