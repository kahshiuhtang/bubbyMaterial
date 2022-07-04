import 'package:flutter/material.dart';
import 'package:ptr/widgets/CustomAppBar.dart';
import 'package:ptr/screens/exploreScreen/components/Body.dart';

class ExploreScreen extends StatelessWidget {
  static String routeName = "/explore";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: Body());
  }
}