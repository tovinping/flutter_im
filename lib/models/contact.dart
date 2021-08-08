import 'package:flutter_im/models/http.dart';

class ContactModel {
  final String account;
  final String avatar;
  final String name;
  final String email;
  final String pinyin;

  ContactModel(
      {required this.account,
      required this.avatar,
      required this.name,
      required this.email,
      required this.pinyin});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      account: json['account'],
      avatar: json['avatar'],
      name: json['name'],
      email: json['email'],
      pinyin: json['pinyin']);
}

class LoginRequested extends HttpModel {
  int timestamp = 0;

  LoginRequested.fromJson(Map<String, dynamic> json) : super(json) {
    final data = json['data'];
    if (data != null) {
      this.timestamp = data;
    }
  }
}

class UserListRequested extends HttpModel {
  List<ContactModel> userList = [];

  UserListRequested.fromJson(Map<String, dynamic> json) : super(json) {
    final list = json['data'] as List<dynamic>;
    userList = list.map((item) => ContactModel.fromJson(item)).toList();
  }
}
