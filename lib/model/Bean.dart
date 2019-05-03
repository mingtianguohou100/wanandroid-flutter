import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid_flutter/net/request_base_bean.dart';
part 'Bean.g.dart';

@JsonSerializable()
class Bean extends RequestBaseBean<String>{
  Bean(data, String errorMsg, int errorCode) : super(data, errorMsg, errorCode);

  factory Bean.fromJson(Map<String, dynamic> srcJson) =>
      _$BeanFromJson(srcJson);
}
