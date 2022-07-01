import 'package:flutter/material.dart';

import 'components/body.dart';

class ExploreScreen extends StatelessWidget {
  @override
  String routeName = '/explore';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
