import 'package:flutter/material.dart';
import './components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgotPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
