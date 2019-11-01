class Api {
  static const String BASE_URL = "https://wanandroid.com/";
  static const String GET_TYPE = "get";
  static const String POST_TYPE = "post";

  ///请求成功返回的状态码
  static const int SUCCESS_CODE = 0;
  static const DEBUG = true;

  ///首页banner
  static const String HOME_BANNER = "banner/json";

  ///首页文章列表
  static const String HOME_ARTICLE_LIST = "article/list/0/json";

  ///登录
  static const String LOGIN_URL = "user/login";

  ///注册
  static const String REGISTER_URL = "user/register";

  ///退出登录
  static const String LOGIN_OUT = "user/logout/json";
}
