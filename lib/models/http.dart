class HttpModel<T> {
  int code;
  String msg;
  T data;
  HttpModel(this.code, this.msg, this.data);
  factory HttpModel.fromJson(Map<String, dynamic> json) {
    return HttpModel(json['code'], json['msg'], json['data']);
  }
}