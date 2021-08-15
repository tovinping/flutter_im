import 'dart:io';
import 'dart:convert';

const devBaseUrl = 'http://192.168.2.101:4000';

class HttpResult<T> {
  int code;
  String msg;
  T? data;
  HttpResult(this.code, this.msg, this.data);
  factory HttpResult.fromJson(String responseStr, Function formatFn) {
    final json = jsonDecode(responseStr);
    print('FFFF $json');
    if (json['data'] != null) {
      return HttpResult(json['code'], json['msg'], formatFn(json['data']));
    } else {
      return HttpResult(json['code'], json['msg'], null);
    }
  }
}

class HttpRequest {
  static Future<String> parseResponse(HttpClientResponse response) async {
    if (response.statusCode == HttpStatus.ok) {
      final responseStr = response.transform(utf8.decoder).join();
      return responseStr;
    } else {
      print('parse request error code: ${response.statusCode}');
      return '{"code": 1, "msg": "请求发生错误"}';
    }
  }

  static Future<String> get(String path) async {
    var httpClient = new HttpClient();
    httpClient.connectionTimeout = Duration(seconds: 5);
    var uri = Uri.parse(devBaseUrl + path);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    return parseResponse(response);
  }

  static Future<String> post(String path, [data]) async {
    var httpClient = new HttpClient();
    httpClient.connectionTimeout = Duration(seconds: 5);
    var uri = Uri.parse(devBaseUrl + path);
    try {
      print('post start: $uri');
      HttpClientRequest request = await httpClient.postUrl(uri);
      request.headers.set('content-type', 'application/json');
      if (data != null) {
        print('request: $data');
        request.add(utf8.encode(data));
      }
      HttpClientResponse response = await request.close();
      print('post Result: $response.statusCode');
      return parseResponse(response);
    } catch (err) {
      print('post error: $err');
      return '{"code": 1, "msg": "$err"}';
    }
  }
}
