import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/screens/forgotPassword/components/forms.dart';
import 'package:ptr/widgets/HeaderLogoWidget.dart';
import 'package:ptr/widgets/Utils.dart';

class Body extends StatefulWidget {
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<Body> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          HeaderLogoWidget(),
          Forms(),
        ]));
  }
}
