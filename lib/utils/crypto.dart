import 'dart:convert';

import 'package:crypto/crypto.dart';
String generatorMd5(String str) {
  var content = new Utf8Encoder().convert(str);
  var md5Content =  md5.convert(content);
  return md5Content.toString();
}