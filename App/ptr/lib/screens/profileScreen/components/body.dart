import 'package:flutter/material.dart';
import 'package:ptr/screens/profileScreen/components/ProfileAppBar.dart';
import 'package:ptr/screens/profileScreen/components/ProfileWidget.dart';
import 'package:ptr/screens/profileScreen/components/experienceBarWidget.dart';
import 'package:ptr/screens/profileScreen/components/nameTag.dart';

import '../../../widgets/CustomAppBar.dart';

class Body extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfileAppBar(),
        body: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: CircleAvatar(
                minRadius: 100.0,
                maxRadius: 100.0,
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/237/200/300'),
              )),
          NameWidget(),
          ProfileWidget(),
          ExperienceBarWidget()
        ]));
  }
}
