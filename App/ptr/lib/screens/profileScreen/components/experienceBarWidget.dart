import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/71760516/how-to-create-stacked-bar-progress-bar-in-flutter-like-this-image
class ExperienceBarWidget extends StatefulWidget {
  @override
  ExperienceBarWidgetState createState() => ExperienceBarWidgetState();
}

class ExperienceBarWidgetState extends State<ExperienceBarWidget> {
  double currentStatus = 0.5;
  int level = 1;
  int requiredPoints = 100;
  double currentPoints = 0;
  void updateProgress(int val) {}
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 16,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Stack(children: <Widget>[
                        LinearProgressIndicator(
                            minHeight: 16,
                            backgroundColor: Color.fromARGB(255, 170, 166, 148),
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 209, 208, 163)),
                            value: currentStatus),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            style: TextStyle(
                              color: Color.fromARGB(255, 55, 55, 71),
                              fontWeight: FontWeight.bold,
                            ),
                            "Level ${level}: ${(currentStatus * requiredPoints).round()}/${requiredPoints} Points",
                          ),
                        )
                      ])),
                ),
              ]),
            ]));
  }
}
