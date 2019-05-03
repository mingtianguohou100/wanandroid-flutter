import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid_flutter/net/request_base_bean.dart';

part 'UserLoginBean.g.dart';

@JsonSerializable()
class UserLoginBean extends RequestBaseBean<UserBean> {
  UserLoginBean(UserBean data, int errorCode, String errorMsg)
      : super(data, errorMsg, errorCode);

  factory UserLoginBean.fromJson(Map<String, dynamic> srcJson) =>
      _$UserLoginBeanFromJson(srcJson);
}

@JsonSerializable()
class UserBean {
  @JsonKey(name: 'chapterTops')
  List<dynamic> chapterTops;

  @JsonKey(name: 'collectIds')
  List<dynamic> collectIds;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'username')
  String username;

  UserBean(this.chapterTops, this.collectIds, this.email, this.icon, this.id,
      this.password, this.token, this.type, this.username);


  factory UserBean.fromJson(Map<String, dynamic> srcJson) =>
      _$UserBeanFromJson(srcJson);

  @override
  String toString() {
    return 'UserBean{chapterTops: $chapterTops, collectIds: $collectIds, email: $email, icon: $icon, id: $id, password: $password, token: $token, type: $type, username: $username}';
  }
}
