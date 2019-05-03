import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignWidget extends StatefulWidget {
  @override
  _AlignWidgetState createState() => _AlignWidgetState();
}

class _AlignWidgetState extends State<AlignWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            child: Text("Align_topLeft"),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Text("Align_topRight"),
            alignment: Alignment.topRight,
          ),
          Align(
            child: Text("Align_bottomLeft"),
            alignment: Alignment.bottomLeft,
          ),
          Align(
            child: Text("Align_bottomRight"),
            alignment: Alignment.bottomRight,
          ),
          Align(
            child: Text("Align_center"),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
