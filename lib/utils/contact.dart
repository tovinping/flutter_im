import 'package:flutter_im/models/contact.dart';

formatUserList(List<dynamic> json) {
  final userList = json.map((item) => ContactModel.fromJson(item)).toList();
  return userList;
}
