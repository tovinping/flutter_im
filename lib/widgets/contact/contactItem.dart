import 'package:flutter/material.dart';
import 'package:flutter_im/models/user.dart';
import '../common/avatar.dart';

class ContactItem extends StatelessWidget {
  final UserModel userInfo;
  ContactItem(this.userInfo);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => print('AAAA'),
      onLongPress: () => print('LLLL'),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Avatar(avatar: userInfo.avatar),
          Expanded(
            flex: 1,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: .5, color: Colors.black12))),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInfo.name,
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
