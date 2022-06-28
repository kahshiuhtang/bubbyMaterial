import 'package:flutter/material.dart';
import 'package:ptr/screens/home/HomeScreen.dart';
import 'package:ptr/screens/login/LoginScreen.dart';

final Map<String, WidgetBuilder> routes_ = {
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
};