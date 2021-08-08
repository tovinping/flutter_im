import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';
import 'package:flutter_im/utils/storage.dart';
import 'package:flutter_im/widgets/chat/chatItem.dart';
import 'package:provider/provider.dart';
import 'package:flutter_im/provider/chat.dart';
import 'package:flutter_im/widgets/common/empty.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State {
  @override
  void initState() {
    super.initState();
    _initialData();
  }

  _initialData() async {
    final list = await getChatList();
    context.read<ChatProvider>().batchAddChat(list);
  }

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chatList = context.watch<ChatProvider>().chatList;
    return Scaffold(
        body: chatList.length > 0
            ? ListView(
                children: chatList.map((e) => ChatItem(e)).toList(),
              )
            : EmptyState());
  }
}
