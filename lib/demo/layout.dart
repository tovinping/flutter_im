import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('layoutDemo'),
      ),
      body: Container(
          width: double.infinity,
          color: Colors.black12,
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '我是中国人' * 20,
                ),
                Container(
                  color: Colors.blue,
                  child: Align(
                      alignment: Alignment.topRight,
                      widthFactor: 4,
                      heightFactor: 4,
                      child: new Icon(
                        Icons.add,
                        color: Colors.yellow,
                        size: 40.0,
                      )),
                ),
                Text('他是歪国人' * 30)
              ],
            ),
          )),
    );
  }
}
