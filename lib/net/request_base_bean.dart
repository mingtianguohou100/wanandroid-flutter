class RequestBaseBean<T> {
  T data;
  int errorCode;
  String errorMsg;

  RequestBaseBean(this.data, this.errorMsg, this.errorCode);
}
