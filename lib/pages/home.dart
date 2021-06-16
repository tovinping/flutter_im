import 'package:flutter/material.dart';
import 'package:flutter_im/pages/contact.dart';
import 'chat.dart';
import 'chat.dart';
import 'me.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  int _currentIndex = 0;
  List<String> tabs = ['消息', '联系人', '我的'];
  List<Widget> pages = [ChatPage(), ContactPage(), MetPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: '消息'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: '联系人'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
      ),
    );
  }
}
