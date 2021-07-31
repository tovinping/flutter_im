import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';
import '../common/avatar.dart';

class ChatItem extends StatelessWidget {
  ChatItem(ChatModel data);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Avatar(avatar: ''),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('姓名'), Text('最后一条消息')],
            ),
          )
        ],
      ),
    );
  }
}
