class HttpModel<T> {
  int code = 0;
  String msg = '';
  HttpModel({code, msg}) {
    this.code = code;
    this.msg = msg;
  }
}