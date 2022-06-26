import 'package:flutter/material.dart';

class ObjectiveChoicesWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  ObjectiveChoicesWidget({required this.text, required this.isDone});
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
              child: isDone
                  ? Icon(Icons.check_box_outlined)
                  : Icon(Icons.check_box_outline_blank)),
          Text(text ?? "(Unnamed Text)",
              style: TextStyle(
                  color: isDone ? Color(0xFF211551) : Color(0xFF86829D),
                  fontSize: 16.0,
                  fontWeight: isDone ? FontWeight.bold : FontWeight.normal))
        ]));
  }
}
