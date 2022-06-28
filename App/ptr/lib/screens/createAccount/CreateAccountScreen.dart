import 'package:flutter/material.dart';
import './components/body.dart';

class CreateAccountScreen extends StatelessWidget {
  static String routeName = "/createAccount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
