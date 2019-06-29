import 'package:json_annotation/json_annotation.dart';
part 'UserLoginBean.g.dart';

@JsonSerializable()
class UserLoginBean extends Object {

  @JsonKey(name: 'admin')
  bool admin;

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

  UserLoginBean(this.admin,this.chapterTops,this.collectIds,this.email,this.icon,this.id,this.password,this.token,this.type,this.username,);

  factory UserLoginBean.fromJson(Map<String, dynamic> srcJson) => _$UserLoginBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserLoginBeanToJson(this);

  @override
  String toString() {
    return 'UserLoginBean{admin: $admin, chapterTops: $chapterTops, collectIds: $collectIds, email: $email, icon: $icon, id: $id, password: $password, token: $token, type: $type, username: $username}';
  }

}


