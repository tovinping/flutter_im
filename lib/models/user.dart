import 'package:flutter_im/models/http.dart';

class UserModel {
  final String name;
  final String email;

  UserModel(this.name, this.email);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(json['name'], json['email']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class LoginRequested extends HttpModel {
  int timestamp = 0;

  LoginRequested.fromJson(Map<String, dynamic> json)
      : super(code: json['code'], msg: json['msg']) {
    final data = json['data'];
    if (data != null) {
      this.timestamp = data;
    }
  }
}

class UserListRequested extends HttpModel {
  List<UserModel> userList = [];

  UserListRequested.fromJson(Map<String, dynamic> json)
      : super(code: json['code'], msg: json['msg']) {
    final userList = json['data'];
    if (userList != null) {
      this.userList = userList;
    }
  }
}
