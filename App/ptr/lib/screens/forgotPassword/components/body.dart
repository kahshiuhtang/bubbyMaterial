import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/widgets/Utils.dart';

class Body extends StatefulWidget {
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<Body> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  resetPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Password Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
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
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Recieve an email to reset your password.",
              style: TextStyle(
                  color: Color.fromARGB(255, 124, 108, 119),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 124, 108, 119)),
              onPressed: resetPassword,
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]));
  }
}
