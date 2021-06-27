import 'package:flutter/material.dart';
import 'package:flutter_im/utils/iconfont.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconFont.icon_xiaoxi,
            color: Colors.black26,
            size: 80,
          ),
          Text(
            '暂时没有新消息',
            style: TextStyle(color: Colors.black26),
          )
        ],
      ),
    );
  }
}
