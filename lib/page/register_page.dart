import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';
import 'package:wanandroid_flutter/model/Bean.dart';
import 'package:wanandroid_flutter/model/UserLoginBean.dart';
import 'package:wanandroid_flutter/net/common_service.dart';
import 'package:wanandroid_flutter/utils/common_util.dart';
import 'package:wanandroid_flutter/widget/custom_route.dart';
import 'package:wanandroid_flutter/widget/user_account_text_field_widget.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey;
  var _global;
  TextEditingController _textEditingController_count;
  TextEditingController _textEditingController_password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _global = GlobalKey<ScaffoldState>();
    _formKey = GlobalKey<FormState>();
    _textEditingController_count = TextEditingController();
    _textEditingController_password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _global,
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).register),
      ),
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(30.0),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset("resources/images/flutter_logo.png",
                          color: Theme.of(context).primaryColor),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                      ),
                      UserAccountTextFieldWidget(
                          true, _textEditingController_count),
                      UserAccountTextFieldWidget(
                          false, _textEditingController_password),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                      WanAndroidLocalizations.of(context).submission,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    regiestCheckRegister();
                                  },
                                )),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );


  }

  void regiestCheckRegister() {
    (_formKey.currentState as FormState).validate()
        ? CommonService.instance.getRegister({
            "username": _textEditingController_count.text,
            "password": _textEditingController_password.text,
            "repassword": _textEditingController_password.text,
          }, (UserBean ub) {
            Navigator.of(context).pop(WanAndroidLocalizations.of(context).register_ok);
          }, onErro: (e) {
            _global.currentState.showSnackBar(CommonUilt.myShowSnackBar(e));
          })
        : _global.currentState
            .showSnackBar(CommonUilt.myShowSnackBar(WanAndroidLocalizations.of(context).checkinput));
  }
}
