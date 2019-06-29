// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLoginBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginBean _$UserLoginBeanFromJson(Map<String, dynamic> json) {
  return UserLoginBean(
      json['admin'] as bool,
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

Map<String, dynamic> _$UserLoginBeanToJson(UserLoginBean instance) =>
    <String, dynamic>{
      'admin': instance.admin,
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
