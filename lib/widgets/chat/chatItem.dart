import 'package:flutter/material.dart';
import 'package:flutter_im/models/chat.dart';
import '../common/avatar.dart';

class ChatItem extends StatelessWidget {
  ChatItem(ChatModel data);
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => {print('click')},
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
              children: [Text('姓名'), Text('最后一条消息')],
            ),
          )
        ],
      ),
    );
  }
}
