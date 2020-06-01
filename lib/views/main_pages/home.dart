import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _margins = 20.0;
  final _padding = 20.0;
  final _mainColor = Colors.red[900];
  final _decoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.2),
        blurRadius: 8.0, // soften the shadow
        offset: Offset(0, 4.0),
      )
    ],
  );

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
              _buildLastWorkoutBox(),
              _buildNextWorkoutBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastWorkoutBox() {
    return Container(
      decoration: _decoration,
      margin: EdgeInsets.only(bottom: _margins),
      padding: EdgeInsets.all(_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBoxTitle('Last Workout (5/24)'),
          SizedBox(height: _padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildExerciseStatusText('SQ 135 lb', true),
              _buildExerciseStatusText('BP 135 lb', false),
              _buildExerciseStatusText('ROW 135 lb', true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNextWorkoutBox() {
    return Container(
      decoration: _decoration,
      padding: EdgeInsets.all(_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildBoxTitle('Next Workout'),
          SizedBox(height: _padding),
          Center(
            child: Column(children: <Widget>[
              _buildExerciseText('SQ', '5x5', '140 lb'),
              SizedBox(height: 5),
              _buildExerciseText('OHP', '5x5', '95 lb'),
              SizedBox(height: 5),
              _buildExerciseText('DL', '5x5', '185 lb'),
            ]),
          ),
          SizedBox(height: _padding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                splashColor: _mainColor.withOpacity(.1),
                highlightColor: _mainColor.withOpacity(.1),
                child: Text(
                  'BEGIN WORKOUT',
                  textScaleFactor: 2.0,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: _mainColor),
                ),
                height: 75,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseStatusText(String text, bool completed) {
    if (completed)
      return Text(text + ' ✔', style: _greenText, textScaleFactor: .8);
    else
      return Text(text + ' ✘', style: _redText, textScaleFactor: .8);
  }

  Widget _buildExerciseText(String ex, String sr, String wt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(child: Text(ex, textAlign: TextAlign.left)),
        Expanded(child: Text(sr, textAlign: TextAlign.center)),
        Expanded(child: Text(wt, textAlign: TextAlign.right)),
      ],
    );
  }

  Widget _buildBoxTitle(String text) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
