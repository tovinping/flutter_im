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

class LoginResModel {
  final int timestamp;

  LoginResModel(this.timestamp);

  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      LoginResModel(json['timestamp']);
}

class LoginReqModel {
  final String account;
  final String password;

  LoginReqModel(this.account, this.password);

  factory LoginReqModel.fromJson(Map<String, dynamic> json) =>
      LoginReqModel(json['account'], json['password']);
}
