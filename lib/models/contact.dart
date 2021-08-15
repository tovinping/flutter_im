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

  static ContactModel fromJson(Map<String, dynamic> json) => ContactModel(
      account: json['account'],
      avatar: json['avatar'],
      name: json['name'],
      email: json['email'],
      pinyin: json['pinyin']);
}

class LoginRequested {
  int timestamp = 0;
  LoginRequested(this.timestamp);
  static fromJson(int json) {
    return LoginRequested(json);
  }
}
