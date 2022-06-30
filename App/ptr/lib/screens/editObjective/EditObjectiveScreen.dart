import 'package:flutter/material.dart';
import 'package:ptr/screens/editObjective/components/body.dart';
import '../../widgets/ObjectiveChoicesWidget.dart';
import 'package:ptr/services/DatabaseHelper.dart';
import 'package:ptr/models/objective.dart';

class EditObjectiveScreen extends StatelessWidget {
  static String routeName = "/editObjective";

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
