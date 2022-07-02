import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  String name = "Doby The Dog";
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 124, 108, 119),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
                onPressed: () {},
                child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                    )))));
  }
}
