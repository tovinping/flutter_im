import 'package:flutter/material.dart';
import 'package:flutter_im/utils/color.dart';
import 'package:flutter_im/utils/iconfont.dart';
import 'chat.dart';
import 'contact.dart';
import 'me.dart';

class HomeTabItem {
  String text = '';
  late Icon icon;

  HomeTabItem(this.text, this.icon);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<HomeTabItem> tabs = [
    HomeTabItem('消息', Icon(IconFont.icon_xiaoxi)),
    HomeTabItem('联系人', Icon(IconFont.icon_tongxunlu)),
    HomeTabItem('我的', Icon(IconFont.icon_ziyuan))
  ];
  List<Widget> pages = [ChatPage(), ContactPage(), MetPage()];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = TabController(length: this.tabs.length, vsync: this);
  }

  List<Tab> _renderTab() {
    return this
        .tabs
        .map((e) => Tab(
              text: e.text,
              icon: e.icon,
              iconMargin: EdgeInsets.zero,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: _controller,
          children: pages,
        ),
        bottomNavigationBar: Container(
          height: 55,
          decoration: BoxDecoration(
            color: HexColor('F7F7F7'),
            border: Border(
              top: BorderSide(
                color: HexColor('DCDCDC'), //边框颜色
              ),
            ),
          ),
          child: TabBar(
            controller: _controller,
            labelStyle: TextStyle(fontSize: 12),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black87,
            indicator: BoxDecoration(),
            overlayColor: MaterialStateProperty.all(Color(0xff31C27C)),
            tabs: _renderTab(),
          ),
        ));
  }
}
