import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid_flutter/net/request_base_bean.dart';

part 'HomeBannerBean.g.dart';

@JsonSerializable()
class HomeBannerBean extends RequestBaseBean<List<HomeBannerItemModel>> {

  HomeBannerBean(List<HomeBannerItemModel> data, int errorCode, String errorMsg)
      : super(data, errorMsg, errorCode);


  factory HomeBannerBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerBeanFromJson(srcJson);

}

@JsonSerializable()
class HomeBannerItemModel {
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

  HomeBannerItemModel(
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  );

  factory HomeBannerItemModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerItemModelFromJson(srcJson);

  @override
  String toString() {
    return 'HomeBannerItemModel{desc: $desc, id: $id, imagePath: $imagePath, isVisible: $isVisible, order: $order, title: $title, type: $type, url: $url}';
  }
}
