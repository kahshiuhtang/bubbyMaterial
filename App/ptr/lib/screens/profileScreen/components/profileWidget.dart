import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  int totalPoints = 0;
  int totalNegativeActions = 0;
  int totalPositiveActions = 0;
  double averageScorePerDay = 0;
  int bestDayPoints = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle sty = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    TextStyle sty1 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );

    EdgeInsets p = EdgeInsets.only(top: 10);
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 10.0, right: 10),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 124, 108, 119),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: p,
                      child: Text("Total Points Scored: ", style: sty),
                    ),
                    Padding(
                        padding: p,
                        child: Text("${totalPoints} Points", style: sty1)),
                  ]),
                  Divider(color: Colors.white, thickness: 3),
                  Row(children: <Widget>[
                    Padding(
                      padding: p,
                      child: Text("Total Positives: ", style: sty),
                    ),
                    Padding(
                        padding: p,
                        child:
                            Text("${totalPositiveActions} Acts", style: sty1)),
                  ]),
                  Divider(color: Colors.white, thickness: 3),
                  Row(children: <Widget>[
                    Padding(
                      padding: p,
                      child: Text("Total Negatives: ", style: sty),
                    ),
                    Padding(
                        padding: p,
                        child:
                            Text("${totalNegativeActions} Acts", style: sty1)),
                  ]),
                  Divider(color: Colors.white, thickness: 3),
                  Row(children: <Widget>[
                    Padding(
                      padding: p,
                      child: Text("Best Day: ", style: sty),
                    ),
                    Padding(
                        padding: p,
                        child: Text("${totalPoints} Points", style: sty1)),
                  ]),
                  Divider(color: Colors.white, thickness: 3),
                  Row(children: <Widget>[
                    Padding(
                      padding: p,
                      child: Text("Average Day Score: ", style: sty),
                    ),
                    Padding(
                        padding: p,
                        child: Text("${averageScorePerDay} Points Per Day",
                            style: sty1)),
                  ]),
                ])));
  }
}
