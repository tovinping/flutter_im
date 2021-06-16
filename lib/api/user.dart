import 'dart:convert';

import 'package:flutter_im/models/user.dart';
import 'package:flutter_im/utils/crypto.dart';
import 'package:flutter_im/utils/http.dart';

Future<LoginRequested> doLogin({required String account, required String password}) async {
  String md5Pwd = generatorMd5(password);
  final jsonStr = jsonEncode({'account': account, 'password': md5Pwd});
  final result = await HttpRequest.post('/user/login', jsonStr);
  return LoginRequested.fromJson(result);
}