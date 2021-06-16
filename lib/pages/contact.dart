import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPage createState() => _ContactPage();
}

class _ContactPage extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('联系人'),
      ),
      body: Center(
        child: Text('联系人'),
      ),
    );
  }
}
