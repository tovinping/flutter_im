import 'dart:convert';

import 'package:flutter_im/models/contact.dart';
import 'package:flutter_im/utils/contact.dart';
import 'package:flutter_im/utils/crypto.dart';
import 'package:flutter_im/utils/http.dart';

Future<HttpResult<int>> doLogin(
    {required String account, required String password}) async {
  String md5Pwd = generatorMd5(password);
  final jsonStr = jsonEncode({'account': account, 'password': md5Pwd});
  final resultStr = await HttpRequest.post('/user/login', jsonStr);
  return HttpResult<int>.fromJson(resultStr, LoginRequested.fromJson);
}

Future<HttpResult<List<ContactModel>>> getContacts() async {
  final resultStr = await HttpRequest.get('/user/list');
  final result =
      HttpResult<List<ContactModel>>.fromJson(resultStr, formatUserList);
  return result;
}
