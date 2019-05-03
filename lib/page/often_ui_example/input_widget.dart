import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

/**
 * 输入框
 * **/
class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  GlobalKey<ScaffoldState> _global;
  GlobalKey<FormState> _formKey;
  TextEditingController _userTd;
  TextEditingController _pwdTd;
  TextEditingController _bigTd;
  bool _pwdIsShow; //密码是否可见

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userTd = TextEditingController();
    _pwdTd = TextEditingController();
    _bigTd = TextEditingController();
    _global = GlobalKey<ScaffoldState>();
    _formKey = GlobalKey<FormState>();
    _pwdIsShow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _global,
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).form_option),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          createTextFormFieldNumber(),
          createTextFormFieldPwd(),
          createTextFormFieldBig(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("提交"),
          onPressed: () {
            onSubmission(context);
          }),
    );
  }

  Widget createTextFormFieldNumber() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: TextFormField(
        controller: _userTd,
        autocorrect: false,
        //是否自动校验
        keyboardType: TextInputType.number,
        validator: (v) {
          return v.trim().length == 11 ? null : "请输入11位手机号";
        },
        decoration: InputDecoration(
          icon: Icon(Icons.perm_contact_calendar),
          labelText: "输入数字账号",
          hintText: "请输入数字账号",
        ),
      ),
    );
  }

  Widget createTextFormFieldBig() {
    return Padding(
      child: TextFormField(
        controller: _bigTd,
        autocorrect: false,
        maxLines: 5,
        validator: (v) {
          return v.trim().length > 5 ? null : "请输入5位数以上的建议";
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "输入建议",
          hintText: "请输入您的建议",
        ),
      ),
      padding: EdgeInsets.all(15.0),
    );
  }

  Widget createTextFormFieldPwd() {
    return TextFormField(
      controller: _pwdTd,
      obscureText: _pwdIsShow,
      autocorrect: false,
      validator: (v) {
        return v.trim().length == 6 ? null : "请输入6位数密码";
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _pwdIsShow = !_pwdIsShow;
            });
          },
          child: Icon(_pwdIsShow ? Icons.visibility_off : Icons.visibility),
        ),
        //后缀图标
        icon: Icon(Icons.scanner),
        labelText: "输入密码",
        hintText: "请输入密码",
      ),
    );
  }

  void onSubmission(BuildContext context) {
    if (_formKey.currentState.validate()) {
      createDialog(context);
    } else {
      SnackBar sb = SnackBar(
        content: Text("校验失败"),
      );
      _global.currentState.showSnackBar(sb);
    }
  }

  void createDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("账户:${_userTd.text}"),
              Text("密码:${_pwdTd.text}"),
              Text("建议:${_bigTd.text}"),
            ],
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                "确定",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text("取消", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
