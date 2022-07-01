import 'package:flutter/material.dart';
import 'package:ptr/explore/ExploreScreen.dart';
import 'package:ptr/screens/createAccount/CreateAccountScreen.dart';
import 'package:ptr/screens/editObjective/EditObjectiveScreen.dart';
import 'package:ptr/screens/forgotPassword/ForgotPasswordScreen.dart';
import 'package:ptr/screens/home/HomeScreen.dart';
import 'package:ptr/screens/login/LoginScreen.dart';

final Map<String, WidgetBuilder> routes_ = {
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  CreateAccountScreen.routeName: (BuildContext context) =>
      CreateAccountScreen(),
  ForgotPasswordScreen.routeName: (BuildContext context) =>
      ForgotPasswordScreen(),
  EditObjectiveScreen.routeName: (BuildContext context) =>
      EditObjectiveScreen(),
  ExploreScreen().routeName: (BuildContext context) => ExploreScreen(),
};
