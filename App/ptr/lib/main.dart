import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/routes.dart';
import 'package:ptr/screens/createAccount/CreateAccountScreen.dart';
import 'package:ptr/screens/login/LoginScreen.dart';
import 'package:ptr/widgets/BottomNavigationBar.dart';
import './widgets/ObjectiveCardWidget.dart';
import 'screens/home/HomeScreen.dart';
import 'package:ptr/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bubbyMaterial',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: routes_,
    );
  }
}

class MainScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LoginScreen();
              } else {
                return LoginScreen();
              }
            }));
  }
}
