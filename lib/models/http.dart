class HttpModel {
  final int code;
  final String msg;
  final Map data;
  HttpModel(this.code, this.msg, this.data);
  factory HttpModel.fromJson(Map<String, dynamic> json) {
    return HttpModel(json['code'], json['msg'], json['data']);
  }
}