class   Api {
  static const String BASE_URL = "https://wanandroid.com/";
  static const String GET_TYPE = "get";
  static const String POST_TYPE = "post";
  ///请求成功返回的状态码
  static const int SUCCESS_CODE = 0;
  static const DEBUG = true;
  ///连接服务器超时时间，单位是毫秒.
  static const int CONNECT_TIMEOUT=5000;
  ///接收数据的最长时限.
  static const int RECEIVE_TIMEOUT=3000;

  ///banner
  static const String HOME_BANNER="banner/json";
  ///首页文章列表
  static const String HOME_ARTICLE_LIST="article/list/0/json";
  static const String LOGIN_URL="user/login";
  static const String REGISTER_URL="user/register";
  static const String LOGIN_OUT="user/logout/json";
  ///收藏文章列表
  static const String COLLECT_LIST="lg/collect/list/0/json";
}
