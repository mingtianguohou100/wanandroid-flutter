class MyBannerViewModel{
  String _title;
  String _url;

  MyBannerViewModel(this._title, this._url);

  String get url => _url;

  String get title => _title;

  set url(String value) {
    _url = value;
  }

  set title(String value) {
    _title = value;
  }


}