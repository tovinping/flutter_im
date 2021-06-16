import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/login.dart';
import './demo/layout.dart';
import './demo/willPop.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter im start',
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
      // 注册命名路由表
      routes: <String, WidgetBuilder>{
        "login": (context) => LoginPage(),
        "demoLayout": (context) => LayoutDemo(),
        "willPop": (context) => WillPop()
      },
    );
  }
}
