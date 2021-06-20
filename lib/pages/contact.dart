import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPage createState() => _ContactPage();
}

class _ContactPage extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text('联系人'),height: 50, width: 60, color: Colors.red,),
      ),
    );
  }
}
