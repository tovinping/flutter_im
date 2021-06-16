import 'dart:io';
import 'dart:convert';
const devBaseUrl = 'http://192.168.2.101:4000';

class HttpRequest {
  static parseResponse(HttpClientResponse response) async {
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = await response.transform(utf8.decoder).join();
      var json = jsonDecode(responseBody);
      print('http result:');
      print(json);
      return json;
    } else {
      return null;
    }
  }
  static get(String path) async {
    var httpClient = new HttpClient();
    var uri = Uri.parse(devBaseUrl + path);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    print(response.statusCode == HttpStatus.ok);
    return parseResponse(response);
  }
  static post(String path, [data]) async {
    var httpClient = new HttpClient();
    var uri = Uri.parse(devBaseUrl + path);
    HttpClientRequest request = await httpClient.postUrl(uri);
    request.headers.set('content-type', 'application/json');
    if (data != null) {
      print('request: $data');
      request.add(utf8.encode(data));
    }
    var response = await request.close();
    return parseResponse(response);
  }
}
