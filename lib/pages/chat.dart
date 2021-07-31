import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/chat/chatList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State {
  // List<ChatModel> _list = [];
  // @override
  // void initState() {
  //   super.initState();
  // }

  // Future<List<ChatModel>> _loadChatList() async {
  //   final list = await getChatList();
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatList());
  }
}
