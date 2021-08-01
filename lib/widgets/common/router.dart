import 'package:flutter/material.dart';

import 'package:flutter_im/pages/chatRoom.dart';
import 'package:flutter_im/pages/home.dart';

// import 'package:flutter_im/demo/layout.dart';
// import 'package:flutter_im/demo/willPop.dart';
// import 'package:flutter_im/pages/chatRoom.dart';

// 声明所有页面
final routes = {
  '/': (context, {arguments}) => HomePage(),
  '/chatRoom': (context, {arguments}) => ChatRoom(arguments),
};

// 处理参数传递
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 获取声明的路由页面函数
  var pageBuilder = routes[settings.name];
  if (pageBuilder != null) {
    if (settings.arguments != null) {
      // 创建路由页面并携带参数
      return MaterialPageRoute(
          builder: (context) =>
              pageBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(builder: (context) => pageBuilder(context));
    }
  }
  return MaterialPageRoute(
      builder: (context) => Container(
            child: Text('404'),
          ));
};
