import 'package:flutter/material.dart';
import 'package:flutter_im/demo/notifier.dart';

// class _TestWidgetA extends StatefulWidget {
//   @override
//   __TestWidgetStateA createState() => new __TestWidgetStateA();
// }

// class __TestWidgetStateA extends State<_TestWidgetA> {
//   @override
//   Widget build(BuildContext context) {
//     print('AAAA');
//     return Text(ShareDataWidget.of(context).aCount.toString());
//   }
// }
class _TestA extends StatelessWidget {
  const _TestA();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (ctx, cart) {
        print('AAAA');
        return Text(cart.age.toString());
      },
    );
  }
}

class _TestB extends StatelessWidget {
  const _TestB();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (ctx, cart) {
        print('BBBBB');
        return Text(cart.name);
      },
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      child: Text("Increment---TANG"),
      //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
      onPressed: () =>
          ChangeNotifierProvider.of<UserInfo>(context).changeAge(33),
    );
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        data: UserInfo('init', 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_TestB(), _TestA(), MyButton()],
        ),
      ),
    );
  }
}

class UserInfo extends ChangeNotifierA {
  UserInfo(this.name, this.age);
  String name; //商品单价
  int age; // 商品份数
  void changeName(String name) {
    this.name = name;
    notifyListeners();
  }

  void changeAge(int age) {
    this.age = age;
    notifyListeners();
  }
}
