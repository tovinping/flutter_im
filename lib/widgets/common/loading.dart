// showDialog<String>(
// context: context,
// builder: (BuildContext context) => Container(
// child: Center(
// child: SizedBox(
// width: 50,
// height: 50,
// child: CircularProgressIndicator(),
// ),
// )),
// )

import 'package:flutter/material.dart';

showLoading(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Container(
      color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        )),
  );
}