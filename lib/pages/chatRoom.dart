import 'package:flutter/material.dart';

class ChatArgType {
  String type = '';
  String conversationId = '';
}

class ChatRoom extends StatefulWidget {
  final data;
  ChatRoom(this.data);
  @override
  State<StatefulWidget> createState() =>
      _ChatRoom(data['conversationId'], data['type']);
}

class _ChatRoom extends State {
  String conversationId;
  String type;
  _ChatRoom(this.conversationId, this.type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(conversationId),
        centerTitle: true,
      ),
      body: Center(child: Text(type)),
    );
  }
}
