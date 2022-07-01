import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ptr/screens/createAccount/components/forms.dart';
import 'package:ptr/widgets/HeaderLogoWidget.dart';
import 'package:ptr/widgets/Utils.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<Body> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: double.infinity,
            color: Color(0xFFF6F6F6),
            child: Column(children: <Widget>[
              HeaderLogoWidget(),
              Forms(),
              Container(
                  padding: EdgeInsets.only(left: 110),
                  child: Row(children: <Widget>[
                    Text("Have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Sign In"))
                  ]))
            ])));
  }
}
