import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptr/widgets/Utils.dart';
import '../../../main.dart';

class Forms extends StatefulWidget {
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseDatabase database = FirebaseDatabase.instance;
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/" + _auth.currentUser!.uid);
      await ref.update({
        _auth.currentUser!.uid: {
          "first name": firstNameController.text.trim(),
          "last name": lastNameController.text.trim(),
          "email": emailController.text.trim(),
          "accountCreated": "" + DateTime.now().toString(),
        }
      });
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Column(children: <Widget>[
      Form(
          key: formKey,
          child: Column(children: <Widget>[
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 7.5, top: 7.5, bottom: 0),
                  child: TextFormField(
                    controller: firstNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null ? 'Please enter valid name' : null,
                    cursorColor: Color.fromARGB(255, 124, 108, 119),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 209, 208, 1163),
                              width: 1.0),
                        ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 124, 108, 119),
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter first name'),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 7.5, right: 15.0, top: 7.5, bottom: 0),
                  child: TextFormField(
                    controller: lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null ? 'Please enter valid name' : null,
                    cursorColor: Color.fromARGB(255, 124, 108, 119),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 209, 208, 1163),
                              width: 1.0),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 124, 108, 119),
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter last name'),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 7.5, bottom: 0),
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value == null || !emailValidatorRegExp.hasMatch(value)
                        ? 'Please enter a valid email'
                        : null,
                cursorColor: Color.fromARGB(255, 124, 108, 119),
                decoration: InputDecoration(
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
                  left: 15.0, right: 15.0, top: 7.5, bottom: 0),
              child: TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value!.length < 6
                    ? 'Password must be at least 6 characters!'
                    : null,
                cursorColor: Color.fromARGB(255, 124, 108, 119),
                obscureText: true,
                decoration: InputDecoration(
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
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 7.5, top: 7.5, bottom: 0),
                  child: TextFormField(
                    controller: usernameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null ? 'Please enter valid username' : null,
                    cursorColor: Color.fromARGB(255, 124, 108, 119),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 209, 208, 1163),
                              width: 1.0),
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 124, 108, 119),
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter username'),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 7.5, right: 15.0, top: 7.5, bottom: 0),
                  child: TextFormField(
                    controller: lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null ? 'Please enter valid name' : null,
                    cursorColor: Color.fromARGB(255, 124, 108, 119),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 209, 208, 1163),
                              width: 1.0),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 124, 108, 119),
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter last name'),
                  ),
                ),
              ),
            ])
          ])),
      Center(
          child: Row(
        children: <Widget>[
          Text('${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
              style: TextStyle(
                  color: Color.fromARGB(255, 124, 108, 119),
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 1),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 124, 108, 119)),
              child: Text(
                  '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (newDate == null) return;
                print("Hello");
                setState(() {
                  selectedDate = newDate;
                });
              }),
        ],
      )),
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
    ]);
  }
}
