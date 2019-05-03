import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';

/*
* 登陆注册时的通用TextFormField
* **/
class UserAccountTextFieldWidget extends StatefulWidget {
  bool _isTag;
  TextEditingController _textEditingController;

  UserAccountTextFieldWidget(
      this._isTag, this._textEditingController); //true=用户名，false=密码

  @override
  _UserAccountTextFieldWidgetState createState() =>
      _UserAccountTextFieldWidgetState();
}

class _UserAccountTextFieldWidgetState
    extends State<UserAccountTextFieldWidget> {
  FocusNode _focusNode;
  bool _select_focus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? _select_focus = true : _select_focus = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget._textEditingController,
        focusNode: _focusNode,
        validator: (v) {
          return widget._isTag
              ? (v.toString().length > 0 && !CommonUilt.cehckIsChinese(v)
              ? null
              : WanAndroidLocalizations.of(context).input_content_count)
              : (v.toString().length > 5 && !CommonUilt.cehckIsChinese(v)
              ? null
              : WanAndroidLocalizations.of(context).input_content_pwd);
        },
        keyboardType: widget._isTag ? TextInputType.phone : TextInputType.text,
        obscureText: widget._isTag ? false : true,
        decoration: InputDecoration(
            labelText: widget._isTag
                ? WanAndroidLocalizations.of(context).account
                :WanAndroidLocalizations.of(context).password,
            hintText: widget._isTag
                ? WanAndroidLocalizations.of(context).inputAccount
                : WanAndroidLocalizations.of(context).inputPassWord,
            prefixIcon: _select_focus
                ? Image.asset(
              "resources/images/huo_true.png",
            )
                : Image.asset("resources/images/huo_false.png")));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
