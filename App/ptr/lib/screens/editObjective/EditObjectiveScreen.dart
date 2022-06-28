import 'package:flutter/material.dart';
import '../../widgets/ObjectiveChoicesWidget.dart';
import 'package:ptr/services/DatabaseHelper.dart';
import 'package:ptr/models/objective.dart';

class EditObjectiveScreen extends StatefulWidget {
  @override
  _EditObjectiveScreen createState() => _EditObjectiveScreen();
}

class _EditObjectiveScreen extends State<EditObjectiveScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.symmetric(
          vertical: 12.0,
        )),
        Row(children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Icon(Icons.arrow_back_outlined))),
          Expanded(
              child: TextField(
                  onSubmitted: (value) async {
                    if (value != "") {
                      Objective newObjective = Objective(
                        id: UniqueKey().hashCode,
                        points: 1,
                        description: "Hello",
                        title: value,
                      );
                      await DatabaseHelper.insertObjective(newObjective);
                      setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Objective Name",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF211551))))
        ]),
        TextField(
            decoration: InputDecoration(
                hintText: "Enter Decription For Objective",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                ))),
        ObjectiveChoicesWidget(text: "Repeatable", isDone: false),
        ObjectiveChoicesWidget(text: "Repeatable 1", isDone: true),
      ]),
      Positioned(
        bottom: 0.0,
        right: 20.0,
        child: GestureDetector(
            onTap: () {},
            child:
                Icon(Icons.add_circle_sharp, color: Colors.purple, size: 65.0)),
      )
    ]))));
  }
}
