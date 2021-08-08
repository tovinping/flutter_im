import 'package:flutter/material.dart';
import 'package:flutter_im/models/contact.dart';
import 'package:flutter_im/pages/chatRoom.dart';
import '../common/avatar.dart';

class ContactItem extends StatelessWidget {
  final ContactModel userInfo;
  ContactItem(this.userInfo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatRoom({})));
      },
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Avatar(
            avatar: userInfo.avatar,
            size: 46,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 46,
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
