import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ptr/models/objective.dart';
import 'package:ptr/widgets/Utils.dart';

import '../../../services/DatabaseHelper.dart';
import '../../../widgets/ObjectiveChoicesWidget.dart';

class Body extends StatefulWidget {
  _EditObjectiveScreenState createState() => _EditObjectiveScreenState();
}

class _EditObjectiveScreenState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final pointsController = TextEditingController();
  addObjective() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("users/" + _auth.currentUser!.uid + "/objectives/");
    try {
      await ref.update({
        titleController.text.trim(): {
          "description": descriptionController.text.trim(),
          "points": pointsController.text.trim(),
          "timesUsed": 0,
          "lastUsed": "" + DateTime.now().toString(),
        }
      });
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create New Objective", style: TextStyle()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: titleController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                value == null ? 'Not Valid Objective Title Name' : null,
            cursorColor: Color.fromARGB(255, 124, 108, 119),
            decoration: InputDecoration(
                labelText: 'Objective Title',
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 124, 108, 119),
                    fontWeight: FontWeight.bold),
                hintText: 'Enter title'),
          ),
          TextFormField(
            controller: descriptionController,
            maxLines: 4,
            cursorColor: Color.fromARGB(255, 124, 108, 119),
            decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 124, 108, 119),
                    fontWeight: FontWeight.bold),
                hintText: 'Enter description'),
          ),
          TextFormField(
            controller: pointsController,
            cursorColor: Color.fromARGB(255, 124, 108, 119),
            decoration: InputDecoration(
                labelText: 'Points',
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 124, 108, 119),
                    fontWeight: FontWeight.bold),
                hintText: 'Enter point value of objective'),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 124, 108, 119)),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: addObjective,
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 124, 108, 119)),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
