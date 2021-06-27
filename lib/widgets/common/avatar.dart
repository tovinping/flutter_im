import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  final double size;
  Avatar({required this.avatar, this.size = 64});
  @override
  Widget build(BuildContext context) {
    if (avatar == '') {
      return Icon(
        Icons.account_box,
        color: Colors.black54,
        size: size,
      );
    } else {
      return Image(image: NetworkImage(avatar));
    }
  }
}
