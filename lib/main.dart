import 'package:flutter/material.dart';
import './widgets/common/router.dart';
import 'package:provider/provider.dart';
import 'provider/chat.dart';
import 'provider/contact.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatProvider()),
          ChangeNotifierProvider(create: (_) => ContactProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter im',
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: '/',
        // 注册命名路由表
        onGenerateRoute: onGenerateRoute);
  }
}
