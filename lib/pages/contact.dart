import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_im/api/user.dart';
import 'package:flutter_im/constants/pageState.dart';
import 'package:flutter_im/models/user.dart';
import 'package:flutter_im/widgets/contact/contactItem.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPage createState() => _ContactPage();
}

class _ContactPage extends State with AutomaticKeepAliveClientMixin {
  List<UserModel> userList = [];
  PageState state = PageState.loading;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), _loadContact);
  }

  _loadContact() async {
    final result = await getContacts();
    this.setState(() {
      userList = result.userList;
      state = PageState.finished;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: state == PageState.loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: userList.map((e) => ContactItem(e)).toList(),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
