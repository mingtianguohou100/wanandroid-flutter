import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class MainState implements Cloneable<MainState> {
  List<BottomNavigationBarItem> bottomNavigationBarItem;
  List<Widget> pages;
  int pagesPosition;


  @override
  MainState clone() {
    return MainState()
      ..bottomNavigationBarItem=bottomNavigationBarItem
      ..pages=pages
      ..pagesPosition=pagesPosition;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
