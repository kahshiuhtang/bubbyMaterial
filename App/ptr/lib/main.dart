import 'package:flutter/material.dart';
import 'package:ptr/screens/loginScreen.dart';
import 'package:ptr/widgets/BottomNavigationBar.dart';
import './widgets/ObjectiveCardWidget.dart';
import 'screens/homeScreen.dart';

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
    );
  }
}
