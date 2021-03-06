import 'package:flutter/material.dart';
import 'package:ptr/widgets/ObjectiveCardWidget.dart';
import 'package:ptr/services/DatabaseHelper.dart';
import 'package:ptr/screens/editObjective/EditObjectiveScreen.dart';

import 'package:ptr/widgets/CustomAppBar.dart';
import 'package:ptr/widgets/BottomNavigationBar.dart';

class Body extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Body> {
  DatabaseHelper dbHelper = new DatabaseHelper();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          int count = 0;
                          if (snapshot.data != null)
                            count = snapshot.data.length;
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
                      showDialog(
                        useSafeArea: false,
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) =>
                            EditObjectiveScreen(),
                      );
                    },
                    child: Icon(
                        color: Color.fromARGB(255, 124, 108, 119),
                        Icons.add_circle_sharp,
                        size: 55.0)),
              ),
            ])),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
