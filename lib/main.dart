import 'package:flutter/material.dart';
// import './pages/home.dart';
import './widgets/common/router.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter im',
        theme: ThemeData(primaryColor: Colors.blue),
        // home: HomePage(),
        initialRoute: '/',
        // 注册命名路由表
        onGenerateRoute: onGenerateRoute);
  }
}
