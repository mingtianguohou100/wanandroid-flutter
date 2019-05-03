// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLoginBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginBean _$UserLoginBeanFromJson(Map<String, dynamic> json) {
  return UserLoginBean(
      json['data'] == null
          ? null
          : UserBean.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$UserLoginBeanToJson(UserLoginBean instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

UserBean _$UserBeanFromJson(Map<String, dynamic> json) {
  return UserBean(
      json['chapterTops'] as List,
      json['collectIds'] as List,
      json['email'] as String,
      json['icon'] as String,
      json['id'] as int,
      json['password'] as String,
      json['token'] as String,
      json['type'] as int,
      json['username'] as String);
}

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'chapterTops': instance.chapterTops,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'password': instance.password,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username
    };
