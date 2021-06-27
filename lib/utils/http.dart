import 'dart:io';
import 'dart:convert';

const devBaseUrl = 'http://192.168.2.101:4000';

class HttpRequest {
  static parseResponse(HttpClientResponse response) async {
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = await response.transform(utf8.decoder).join();
      var json = jsonDecode(responseBody);
      return json;
    } else {
      print('parse request error: $response');
      return {'code': 1, 'msg': '请求发生错误'};
    }
  }

  static get(String path) async {
    var httpClient = new HttpClient();
    httpClient.connectionTimeout = Duration(seconds: 5);
    var uri = Uri.parse(devBaseUrl + path);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    print(response.statusCode == HttpStatus.ok);
    return parseResponse(response);
  }

  static post(String path, [data]) async {
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
      return {'code': 1, 'msg': err.toString()};
    }
  }
}
