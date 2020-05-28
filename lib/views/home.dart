import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _margins = 20.0;
  final _mainColor = Colors.red[900];
  final _decoration = BoxDecoration(color: Colors.white);

  final _redText = TextStyle(color: Colors.red[900]);
  final _greenText = TextStyle(color: Colors.green[700]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _mainColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_margins),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildLastWorkoutCard(),
              buildNextWorkoutCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLastWorkoutCard() {
    return Container(
      decoration: _decoration,
      margin: EdgeInsets.only(bottom: _margins),
      padding: EdgeInsets.all(_margins/2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Last Workout (5/24)", textScaleFactor: 1.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("SQ 135 lb ✔", style: _greenText),
              Text("BP 135 lb ✘", style: _redText),
              Text("DL 135 lb ✔", style: _greenText),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNextWorkoutCard() {
    return Expanded(
      child: Container(
        decoration: _decoration,
        padding: EdgeInsets.all(_margins/2),
        child: Text("Next Workout", textScaleFactor: 1.2),
      ),
    );
  }
}
