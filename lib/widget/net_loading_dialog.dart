import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


///网络请求loading
class NetLoadingDialog extends StatefulWidget {
  @override
  _NetLoadingDialogState createState() => _NetLoadingDialogState();
}

class _NetLoadingDialogState extends State<NetLoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300.0,
      height: 300.0,
      child: SpinKitFadingCircle(
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
        size: 120.0,
      ),
    );
  }
}
