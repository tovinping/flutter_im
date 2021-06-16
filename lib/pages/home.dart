import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  void _goLogin() => {Navigator.of(context).pushNamed('login')};

  void _goLayoutDemo() => {Navigator.of(context).pushNamed('demoLayout')};

  void _goWillPop() => {Navigator.of(context).pushNamed('willPop')};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('Home')),
        body: Container(
          width: double.infinity,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text('goLogin123'),
                onPressed: _goLogin,
              ),
              ElevatedButton(
                  onPressed: _goLayoutDemo, child: Text('goLayoutDemo123')),
              ElevatedButton(onPressed: _goWillPop, child: Text('拦截返回'))
            ],
          ),
        ));
  }
}
