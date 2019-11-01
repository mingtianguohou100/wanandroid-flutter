import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/model/HomeHeadBannerBean.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget buildView(
    HomeHeadState state, Dispatch dispatch, ViewService viewService) {
  HomeHeadState _homeHeadState = state.clone();
  List<HomeHeadBannerBean> _homeBannerItemModel = _homeHeadState.homeBanners;

  ///banner
  Widget _buildBanner() {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SizedBox(
          height: 200.0,
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
            itemBuilder: (c, i) {
              HomeHeadBannerBean _omeBannerItemModel = _homeBannerItemModel[i];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: _omeBannerItemModel.imagePath,
                  placeholder: (context, url) =>
                      Image.asset("resources/images/defult_bac_img.png"),
                  errorWidget: (context, url, error) =>
                      Image.asset("resources/images/defult_bac_img.png"),
                ),
              );
            },
            itemCount:
                _homeBannerItemModel != null ? _homeBannerItemModel.length : 0,
            pagination: _homeBannerItemModel != null
                ? SwiperPagination(
                    margin: EdgeInsets.only(bottom: 15.0),
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white, color: Colors.grey))
                : null,
            onTap: (index) => dispatch(HomeHeadActionCreator.onClickBanner(
                _homeBannerItemModel[index])),
            duration: 3,
          ),
        ));
  }

  return Column(
    children: <Widget>[
      _buildBanner(),
    ],
  );
}
