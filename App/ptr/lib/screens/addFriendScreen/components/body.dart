import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<Body> {
  final titleController = TextEditingController();
  void submit() {}
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Friend", style: TextStyle()),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value == null ? 'Not Valid Username' : null,
              cursorColor: Color.fromARGB(255, 124, 108, 119),
              decoration: InputDecoration(
                  labelText: 'Search Username',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 124, 108, 119),
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter username'),
            ),
            ElevatedButton(onPressed: submit, child: Icon(Icons.add))
          ]),
    );
  }
}
