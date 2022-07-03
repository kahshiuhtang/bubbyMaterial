import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatefulWidget {
  @override
  NameWidgetState createState() => NameWidgetState();
}

class NameWidgetState extends State<NameWidget> {
  var name = "Unnamed BF";
  Map toJson() => {
        'boyFriendName': name,
      };
  void getData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/" +
        FirebaseAuth.instance.currentUser!.uid +
        "/userInfo/boyFriendName");
    DatabaseEvent event = await ref.once();
    if (event.snapshot.value != null) {
      setState(() {
        name = event.snapshot.value.toString().replaceAll("\"", "");
      });
    }
  }

  Widget build(BuildContext context) {
    getData();
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
