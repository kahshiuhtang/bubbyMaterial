import 'package:flutter/material.dart';
import 'package:ptr/widgets/ObjectiveCardWidget.dart';
import 'package:ptr/services/databaseHelper.dart';
import './popups/addObjective.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper dbHelper = new DatabaseHelper();
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
                  child: FutureBuilder(
                      future: dbHelper.getObjectives(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        int count = 0;
                        if (snapshot.data != null) count = snapshot.data.length;
                        return ListView.builder(
                          itemCount: count,
                          itemBuilder: (context, index) {
                            String titl = "";
                            if (snapshot.data != null)
                              titl = snapshot.data[index].title;
                            return ObjectiveCardWidget(title: titl);
                          },
                        );
                      }))
            ]),
            Positioned(
              bottom: 10.0,
              right: -5.0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddObjectivePopUp()))
                        .then((_HomePageState) => setState(() {}));
                  },
                  child: Icon(
                      color: Color(0xFF7349FE),
                      Icons.add_circle_sharp,
                      size: 55.0)),
            ),
          ])),
    ));
  }
}
