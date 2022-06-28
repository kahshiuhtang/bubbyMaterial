import 'package:flutter/material.dart';
import 'package:ptr/routes.dart';
import 'package:ptr/screens/login/LoginScreen.dart';
import 'package:ptr/widgets/BottomNavigationBar.dart';
import './widgets/ObjectiveCardWidget.dart';
import 'screens/home/HomeScreen.dart';
import 'package:ptr/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bubbyMaterial',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: routes_,
    );
  }
}
