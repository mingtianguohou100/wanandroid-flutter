import 'package:json_annotation/json_annotation.dart';

part 'HomeHeadBannerBean.g.dart';


List<HomeHeadBannerBean> getHomeHeadBannerBeanList(List<dynamic> list){
  List<HomeHeadBannerBean> result = [];
  list.forEach((item){
    result.add(HomeHeadBannerBean.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class HomeHeadBannerBean extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  HomeHeadBannerBean(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory HomeHeadBannerBean.fromJson(Map<String, dynamic> srcJson) => _$HomeHeadBannerBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeHeadBannerBeanToJson(this);

}


