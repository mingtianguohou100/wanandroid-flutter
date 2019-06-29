import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestDataBaseAction {
  onQueryAllTab,
  onQueryTab,
  onCreateTab,
  onDeleteTab,
  queryAllTab,
  queryTab,
  createTab,
  deleteTab
}

class TestDataBaseActionCreator {
  static Action onQueryAllTab() {
    return const Action(TestDataBaseAction.onQueryAllTab);
  }

  static Action onQueryTab() {
    return Action(TestDataBaseAction.onQueryTab);
  }

  static Action onCreateTab() {
    return Action(TestDataBaseAction.onCreateTab);
  }

  static Action onDeleteTab() {
    return Action(TestDataBaseAction.onDeleteTab);
  }

  static Action queryAllTab(var data) {
    return Action(TestDataBaseAction.queryAllTab, payload: data);
  }

  static Action queryTab(var data) {
    return Action(TestDataBaseAction.queryTab, payload: data);
  }

  static Action createTab(var data) {
    return Action(TestDataBaseAction.createTab, payload: data);
  }

  static Action deleteTab(var data) {
    return Action(TestDataBaseAction.deleteTab, payload: data);
  }
}
