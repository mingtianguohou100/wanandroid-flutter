import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid_flutter/model/HomeBannerBean.dart';
import 'package:wanandroid_flutter/net/request_base_bean.dart';

part 'HomeWzListBean.g.dart';

@JsonSerializable()
class HomeWzListBean extends RequestBaseBean<HomeWzListItemModel> {
  HomeWzListBean(HomeWzListItemModel data, int errorCode, String errorMsg)
      : super(data, errorMsg, errorCode);

  factory HomeWzListBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeWzListBeanFromJson(srcJson);
}

@JsonSerializable()
class HomeWzListItemModel {
  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  HomeWzListItemModel(this.curPage, this.datas, this.offset, this.over,
      this.pageCount, this.size, this.total);

  factory HomeWzListItemModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeWzListItemModelFromJson(srcJson);
}

@JsonSerializable()
class Datas {
  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  Datas(
      this.apkLink,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.envelopePic,
      this.fresh,
      this.id,
      this.link,
      this.niceDate,
      this.origin,
      this.projectLink,
      this.publishTime,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan);

  factory Datas.fromJson(Map<String, dynamic> srcJson) =>
      _$DatasFromJson(srcJson);
}

@JsonSerializable()
class Tags {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(
    this.name,
    this.url,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);
}
