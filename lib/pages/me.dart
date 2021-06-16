import 'package:flutter/material.dart';

class MetPage extends StatefulWidget {
  @override
  _MetPage createState() => _MetPage();
}

class _MetPage extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}
