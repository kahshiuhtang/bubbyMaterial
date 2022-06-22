import 'package:flutter/material.dart';
import 'package:ptr/widgets/ObjectiveCardWidget.dart';
import './popups/addObjective.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          color: Color(0xFFF6F6F6),
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: ListView(children: [
                ObjectiveCardWidget(title: "Hello World"),
                ObjectiveCardWidget(title: "Hello World 2"),
                ObjectiveCardWidget(title: "Hello World 3"),
                ObjectiveCardWidget(title: "Hello World 4"),
                ObjectiveCardWidget(title: "Hello World 5"),
                ObjectiveCardWidget(title: "Hello World 6"),
                ObjectiveCardWidget(title: "Hello World 7"),
                ObjectiveCardWidget(title: "Hello World 8")
              ]))
            ]),
            Positioned(
              bottom: 10.0,
              right: -5.0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddObjectivePopUp()));
                  },
                  child: Icon(Icons.add_circle_sharp,
                      color: Colors.purple, size: 55.0)),
            ),
          ])),
    ));
  }
}
