import 'package:flutter/material.dart';

class HeaderLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(65.0),
            bottomRight: Radius.circular(65.0)),
        color: Color.fromARGB(255, 124, 108, 119),
      ),
      child: Padding(
          padding: EdgeInsets.only(top: 60.0, bottom: 15.0),
          child: Text("bubby material",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
    );
  }
}
