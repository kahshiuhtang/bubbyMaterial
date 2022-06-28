import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/screens/createAccount/CreateAccountScreen.dart';
import 'package:ptr/screens/login/LoginScreen.dart';
import 'package:ptr/screens/home/HomeScreen.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(65.0),
                  bottomRight: Radius.circular(65.0)),
              color: Color.fromARGB(255, 124, 108, 119),
            ),
            child: Padding(
                padding: EdgeInsets.only(top: 60.0, bottom: 15.0),
                child: Text("bubby material",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 25, bottom: 0),
            child: TextFormField(
              controller: emailController,
              cursorColor: Color.fromARGB(255, 124, 108, 119),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 124, 108, 119), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 209, 208, 1163), width: 1.0),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 124, 108, 119),
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter valid email as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: passwordController,
              cursorColor: Color.fromARGB(255, 124, 108, 119),
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 124, 108, 119), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 209, 208, 1163), width: 1.0),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 124, 108, 119),
                      fontWeight: FontWeight.bold),
                  hintText: 'Enter password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 7.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 30.0,
                width: 100.0,
                child: TextButton(
                  onPressed: () {
                    //Forgot Password
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 124, 108, 119),
                        fontWeight: FontWeight.bold,
                        fontSize: 9),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xff502F4C),
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 124, 108, 119)),
              onPressed: signIn,
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't Have An Account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateAccountScreen.routeName);
                  },
                  child: Text("Click Here"))
            ])
          ]),
        ]),
      ),
    );
  }
}
