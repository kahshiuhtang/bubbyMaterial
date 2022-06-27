import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptr/screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1D0A3),
      appBar: AppBar(
        title: Text(
          "bubby material",
          style: TextStyle(
              color: Color(0xffFFFFFFF),
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        backgroundColor: Color(0xFF7C6C77),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                width: 200,
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 0, bottom: 0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter password'),
            ),
          ),
          FlatButton(
            onPressed: () {
              //Forgot Password
            },
            child: Text(
              'Forgot Password',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xff502F4C),
                borderRadius: BorderRadius.circular(40)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.brown[200]),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Color(0xffffffff), fontSize: 25),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
