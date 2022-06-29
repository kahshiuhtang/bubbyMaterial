import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/widgets/Utils.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  createAccount() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: double.infinity,
            color: Color(0xFFF6F6F6),
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
              Form(
                  key: formKey,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 25, bottom: 0),
                      child: TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            value == null ? 'Please enter a valid email' : null,
                        cursorColor: Color.fromARGB(255, 124, 108, 119),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 124, 108, 119),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 209, 208, 1163),
                                  width: 1.0),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value == null || value!.length < 6
                            ? 'Password must be at least 6 characters!'
                            : null,
                        cursorColor: Color.fromARGB(255, 124, 108, 119),
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 124, 108, 119),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 209, 208, 1163),
                                  width: 1.0),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 124, 108, 119),
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter password'),
                      ),
                    ),
                  ])),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 100),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 124, 108, 119)),
                    onPressed: createAccount,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
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
