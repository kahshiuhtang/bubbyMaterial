import 'package:flutter/material.dart';
import 'package:ptr/screens/profileScreen/components/ProfileWidget.dart';

import '../../../widgets/CustomAppBar.dart';

class Body extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(children: <Widget>[
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
          ),
          ElevatedButton(onPressed: () {}, child: Text("About Me")),
          ProfileWidget(),
        ]));
  }
}
