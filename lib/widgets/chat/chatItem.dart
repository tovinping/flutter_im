import 'package:flutter/material.dart';
import 'package:flutter_im/logic/chat.dart';
import 'package:flutter_im/models/chat.dart';
import 'package:flutter_im/widgets/common/avatar.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chatInfo;
  ChatItem(this.chatInfo);
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => {removeChat(context, chatInfo.conversationId)},
      highlightShape: BoxShape.rectangle, // 不设置会出现个圆形
      containedInkWell: true, // 不设置点击效果是圆形
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Avatar(avatar: ''),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chatInfo.conversationId),
                Text(chatInfo.lastMsgId)
              ],
            ),
          )
        ],
      ),
    );
  }
}
