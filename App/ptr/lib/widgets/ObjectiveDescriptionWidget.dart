import 'package:flutter/material.dart';

class ObjectiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Row(children: [
          Container(
              width: 20.0,
              height: 20.0,
              margin: EdgeInsets.only(right: 12.0),
              //decoration: BoxDecoration(
              //color: Color(0xFF7349FE),
              //borderRadius: BorderRadius.circular(9.0)),
              child: Icon(Icons.check_box_outlined)),
          Text("Hello")
        ]));
  }
}
