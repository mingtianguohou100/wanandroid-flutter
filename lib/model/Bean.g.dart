// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bean _$BeanFromJson(Map<String, dynamic> json) {
  return Bean(
      json['data'], json['errorMsg'] as String, json['errorCode'] as int);
}

Map<String, dynamic> _$BeanToJson(Bean instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
