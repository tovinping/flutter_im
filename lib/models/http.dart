class HttpModel<T> {
  int code = 0;
  String msg = '';
  HttpModel(dynamic json) {
    this.code = json['code'];
    this.msg = json['msg'];
  }
}