import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Color _mainColor = Colors.red[900];
  final double _padding = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _mainColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_padding),
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
      color: Colors.white,
      margin: EdgeInsets.only(bottom: _padding),
      child: SizedBox(height: 100, child: Text("Last workout")),
    );
  }

  Widget buildNextWorkoutCard() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Text("Next workout"),
      ),
    );
  }
}
