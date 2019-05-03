import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

/**
 * 选项框
 * **/
class SelectWidget extends StatefulWidget {
  @override
  _SelectWidgetState createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  int _radioSelect;
  bool _checkButton;
  bool _switchButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _radioSelect = 0;
    _checkButton = false;
    _switchButton = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).select_widget),
      ),
      body: Column(
        children: <Widget>[
          createRodio(),
          createCheckBox(),
          createSwitch(),
        ],
      ),
    );
  }

  /*
  * 创建单选按钮
  * **/
  Widget createRodio() {
    return Row(
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _radioSelect,
          onChanged: (v) {
            setState(() {
              _radioSelect = v;
            });
          },
        ),
        Radio(
          value: 1,
          groupValue: _radioSelect,
          onChanged: (v) {
            setState(() {
              _radioSelect = v;
            });
          },
        ),
        Radio(
          value: 2,
          groupValue: _radioSelect,
          onChanged: (v) {
            setState(() {
              _radioSelect = v;
            });
          },
        ),
      ],
    );
  }

  /*
  * 创建复选按钮
  * **/
  Widget createCheckBox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _checkButton,
          onChanged: (v) {
            setState(() {
              _checkButton = v;
            });
          },
        ),
      ],
    );
  }

  /*
  * 创建设置按钮
  * **/
  Widget createSwitch() {
    return Switch(
      value: _switchButton,
      onChanged: (v) {
        setState(() {
          _switchButton = v;
        });
      },
    );
  }
}
