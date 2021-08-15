class ChatModel {
  final String conversationId;
  final String owner;
  final String type;
  final String lastMsgId;
  final String topState;

  ChatModel(
      {required this.conversationId,
      required this.owner,
      required this.type,
      required this.lastMsgId,
      required this.topState});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      conversationId: json['conversationId'],
      owner: json['owner'],
      type: json['type'],
      lastMsgId: json['lastMsgId'],
      topState: json['topState']);
  Map<String, dynamic> toJson() => {
        'conversationId': conversationId,
        'owner': owner,
        'type': type,
        'lastMsgId': lastMsgId,
        'topState': topState
      };
}

class UserListRequested {
  List<ChatModel> userList = [];

  UserListRequested.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List<dynamic>;
    userList = list.map((item) => ChatModel.fromJson(item)).toList();
  }
}
