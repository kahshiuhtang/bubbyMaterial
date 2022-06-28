import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<Body> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 25, bottom: 0),
                child: TextField(
                  controller: emailController,
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
                child: TextField(
                  controller: passwordController,
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
            ])));
  }
}
