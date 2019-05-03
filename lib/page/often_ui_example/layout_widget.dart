import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/localization/wan_android_localizations.dart';

import 'align_widget.dart';
import 'over_flow_box.dart';

class LayoutWidget extends StatefulWidget {
  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  bool _offstage;
  GlobalKey<ScaffoldState> _globalKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _offstage = false;
    _globalKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(WanAndroidLocalizations.of(context).dialog_widget),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            createRow(),
            createColumn(),
            createContainer(),
            createAlign(),
            createOverflowBox(),
            createSizeBox(),
            createWrap(),
            createOpacity(),
            createisShow(),
            createisGestureList(),
          ],
        ),
      ),
    );
  }

  /**
   *
   * 主轴：对于row来说，水平方向是主轴
   * 次轴：对于row来说，垂直方向是次轴
   * Row({
      ...
      TextDirection textDirection//表示水平方向子widget的布局顺序(是从左往右还是从右往左)，默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)
      MainAxisSize mainAxisSize//表示当前Row在主轴的占用空间，默认是MainAxisSize.max
      VerticalDirection verticalDirection //次轴的对齐方向，默认是VerticalDirection.down，表示从上到下。
      MainAxisAlignment mainAxisAlignment //主轴的排列方式，如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子widgets的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义
      CrossAxisAlignment crossAxisAlignment //次轴的排列方式
      List<Widget> children //子widget
      })
   * **/
  Widget createRow() {
    return Row(
      children: <Widget>[
        Text("row1"),
        Text("row2"),
      ],
    );
  }

  /**
   *  主轴：对于Column来说，垂直方向是主轴
   * 次轴：对于Column来说，水平方向是次轴
   * 属性和row基本一样
   * **/
  Widget createColumn() {
    return Column(
      children: <Widget>[
        Text("column1"),
        Text("column2"),
      ],
    );
  }

  /**
   * Container({
      this.alignment,//内部字widget的对齐方式
      this.padding, //容器内补白，属于decoration的装饰范围
      Color color, // 背景色
      Decoration decoration, // 背景装饰
      Decoration foregroundDecoration, //前景装饰
      double width,//容器的宽度
      double height, //容器的高度
      BoxConstraints constraints, //容器大小的限制条件
      this.margin,//容器外补白，不属于decoration的装饰范围
      this.transform, //变换
      this.child,
      })
      注意: width height 和  constraints 只能存在一个
      color decoration 只能存在一个
      container的默认大小是根据子widget的大小尽量小的展示
   * **/
  Widget createContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: 50.0),
      transform: Matrix4.skew(0.2, 0.2),
      //倾斜效果
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage("resources/images/my_flutter_logo_true.png"),
      )),
      //设置container背景图片
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[Text("container"), Text("container")],
      ),
    );
  }

  Widget createAlign() {
    return RaisedButton(
      child: Text("Align定位控件示例"),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return AlignWidget();
        }));
      },
    );
  }

  Widget createOverflowBox() {
    return RaisedButton(
      child: Text("溢出父容器的控件-OverflowBox"),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return OverflowBoxWidget();
        }));
      },
    );
  }

  /**
   * 固定大小的控件
   * **/
  Widget createSizeBox() {
    return SizedBox(
      child: Container(
        color: Colors.red,
        child: Text("SizeBox"),
      ),
      width: 200.0,
      height: 200.0,
    );
  }

  /**
   * 自动换行布局
   * **/
  Widget createWrap() {
    return Wrap(
      children: <Widget>[
        Text(
            "自动换行布自动换行布局自动换行布局自动换行布局自动换行布局自动换行布局自动换行自动换行布自动换行布局自动换行布局自动换行布局自动换行布局自动换行布局自动换行布局自动换行布布局自动换行布"),
      ],
    );
  }

  /**
   * 透明控件
   * **/
  Widget createOpacity() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        child: Text("半透明控件"),
        color: Colors.red,
        width: 50.0,
        height: 50.0,
      ),
    );
  }

  /**
   * 隐藏/显示
   * **/
  Widget createisShow() {
    return Row(
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: Container(
            color: Colors.red,
            width: 50.0,
            height: 50.0,
          ),
        ),
        Switch(
          value: _offstage,
          onChanged: (v) {
            setState(() {
              _offstage = v;
            });
          },
        ),
      ],
    );
  }

  /**
   * 手势监听
   * **/
  Widget createisGestureList() {
    return GestureDetector(
      onTap: () {
        SnackBar sb = SnackBar(content: Text("点击屏幕:tap"));
        _globalKey.currentState.showSnackBar(sb);
      },
      onLongPress: () {
        SnackBar sb = SnackBar(content: Text("长按屏幕:long"));
        _globalKey.currentState.showSnackBar(sb);
      },
      child: Container(
        color: Colors.red,
        child: Text("点我"),
        width: 100.0,
        height: 100.0,
      ),
    );
  }
}
