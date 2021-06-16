import 'package:flutter/material.dart';

class WillPop extends StatefulWidget {
  @override
  WillPopState createState() => new WillPopState();
}

class WillPopState extends State<WillPop> {
  var _lastPressTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text('1秒内点两返回才会真正退出'),
          ),
        ),
        onWillPop: () async {
          if (DateTime.now().difference(_lastPressTime) >
                  Duration(seconds: 1)) {
            print(_lastPressTime);
            _lastPressTime = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
