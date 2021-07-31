import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';
import 'package:flutter_im/utils/storage.dart';
import 'package:flutter_im/widgets/common/empty.dart';
import './chatItem.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State {
  @override
  void initState() {
    super.initState();
  }

  Future<List<ChatModel>> _loadChatList() async {
    final list = await getChatList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ChatModel>>(
        future: _loadChatList(),
        builder: (context, snap) {
          if (!snap.hasData || snap.data?.length == 0) {
            return EmptyState();
          } else {
            return ListView(
              children: snap.data!.map((e) => ChatItem(e)).toList(),
            );
          }
        },
      ),
    );
  }
}
