import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ptr/widgets/CustomAppBar.dart';

class Body extends StatefulWidget {
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<Body> {
  final database = FirebaseDatabase.instance
      .ref("/users/" + FirebaseAuth.instance.currentUser!.uid + "/friends");
  Widget build(BuildContext context) {
    final userList = database.onValue;
    return SafeArea(
        child: Column(children: [
      Expanded(
          child: StreamBuilder<DatabaseEvent>(
        stream: userList,
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            DataSnapshot data = snapshot.data! as DataSnapshot;
            Map<dynamic, dynamic> values = data.value! as Map<dynamic, dynamic>;
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name: " + values[index]["Text"]),
                        Text("Time: " + values[index]["TextTime"]),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: Text("No Data"));
          }
        },
      ))
    ]));
  }
}
