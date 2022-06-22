import 'package:flutter/material.dart';

class ObjectiveCardWidget extends StatelessWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
  const ObjectiveCardWidget({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Unnamed Objective",
              style: TextStyle(
                  color: Color(0xFF211551),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: 8.0,
            )),
            Text(
              "This a test widget for my new app!",
              style: TextStyle(
                  color: Color(0xFF868290),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)));
  }
}
