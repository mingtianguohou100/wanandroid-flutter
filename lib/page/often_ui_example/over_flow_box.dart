import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 溢出父容器的控件
 * 允许子widget超出父控件的范围
 * **/
class OverflowBoxWidget extends StatefulWidget {
  @override
  _OverflowBoxWidgetState createState() => _OverflowBoxWidgetState();
}

class _OverflowBoxWidgetState extends State<OverflowBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("溢出父容器的控件-OverflowBox"),
      ),
      body: Container(
        color: Colors.blue,
        width: 100.0,
        height: 100.0,
        padding: EdgeInsets.all(50.0),
        child: OverflowBox(
          alignment: Alignment.topLeft,
          maxHeight: 300.0,
          maxWidth: 300.0,
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
