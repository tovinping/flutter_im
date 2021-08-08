import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/api/contact.dart';
import 'package:flutter_im/utils/color.dart';
import 'package:flutter_im/widgets/common/loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  bool pwdShow = false;
  String account = '';
  String password = '';

  handAccountChange(String value) {
    this.account = value;
  }

  handPasswordChange(String value) {
    this.password = value;
  }

  _doLogin() async {
    showLoading(context);
    var loginRes = await doLogin(account: account, password: password);
    print('login Result: ${loginRes.code}, ${loginRes.timestamp}');
    Navigator.pop(context);
    if (loginRes.code == 0) {
      print('登录成功');
    } else {
      print(loginRes.msg);
    }
    // Future.delayed(Duration(seconds: 2), () => {
    // });
    // final http = new HttpRequest();
    // var data = await http.get();
    // print('httpRes');
    // print(data);
    // print('post res:');
    // print(postData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.black38,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: HexColor('F4F5F9')),
                        child: TextField(
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'input your account'),
                          onChanged: handAccountChange,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: HexColor('F4F5F9')),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'input your password'),
                            obscureText: true,
                            maxLines: 1,
                            onChanged: handPasswordChange,
                          )),
                      Padding(
                        child: ConstrainedBox(
                          child: ElevatedButton(
                            child: Text(
                              'Login',
                            ),
                            onPressed: _doLogin,
                          ),
                          constraints: BoxConstraints(
                              minWidth: double.infinity, minHeight: 50.0),
                        ),
                        padding: EdgeInsets.only(top: 30.0),
                      )
                    ],
                  ),
                  // Positioned(
                  //   top: 150,
                  //   child: CircularProgressIndicator(),
                  // )
                ],
              ))),
    );
  }
}
