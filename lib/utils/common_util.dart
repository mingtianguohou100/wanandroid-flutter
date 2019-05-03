import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonUilt {
  static SnackBar myShowSnackBar(String txt) {
    return SnackBar(content: Text(txt));
  }

/*正则
*  RegExp exp = new RegExp(r"*****");
*  // 返回正则表达式匹配项的可迭代对象 print(exp.allMatches("abc def ghi"));
*  // 搜索并返回第一个匹配项，没有则返回null print(exp.firstMatch(""));
*  // 正则表达式是否找到匹配项 print(exp.hasMatch("as"));
*  // 从第几个字符开始匹配正则表达式 print(exp.matchAsPrefix("ab cd", 3));
 *  // 返回正则表达式的第一个匹配字符串 print(exp.stringMatch("abc de"));
*  // 返回正则表达式的字符串表示 print(exp.toString());
* "[A-Za-z0-9]"//英文和数字
* **/
  static bool cehckIsChinese(String txt) {
    RegExp reg_ext = RegExp("[\u4e00-\u9fa5]");//汉字
    return reg_ext.hasMatch(txt);
  }




}
