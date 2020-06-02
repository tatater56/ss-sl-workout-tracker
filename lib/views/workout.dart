import 'package:flutter/material.dart';

const _margins = 20.0;
const _padding = 20.0;
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

String _appbarTitle = 'SL 5x5 - Workout B';

class WorkoutView extends StatefulWidget {
  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        color: _mainColor,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(_margins),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // ExerciseWidget(),
                  // SizedBox(height: _margins),
                  // ExerciseWidget(),
                  // SizedBox(height: _margins),
                  _buildExerciseFocused('Squat', 1, 135, 140),
                  //SizedBox(height: _margins),
                  _buildExerciseUnfocused('OHP', 0, 95),
                  _buildExerciseUnfocused('DL', 0, 185)
                ],
              )),
        ),
      ),
    );
  }
}

Widget _buildExerciseFocused(
    String name, int progress, int oldWeight, int targetWeight) {
  return Container(
    decoration: _decoration,
    padding: const EdgeInsets.all(_padding),
    child: Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child: Text(name)),
        Align(alignment: Alignment.center, child: Text('Set $progress / 5')),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
                '$oldWeight + ${targetWeight - oldWeight}\n$targetWeight lb')),
      ],
    ),
  );
}

Widget _buildExerciseUnfocused(String name, int progress, int targetWeight) {
  return Padding(
    padding: const EdgeInsets.all(_padding).copyWith(bottom: _padding / 2),
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.white, fontSize: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text('$name', textAlign: TextAlign.left)),
          Expanded(
              child: Text(progress == 0 ? '5 x 5' : '$progress / 5',
                  textAlign: TextAlign.center)),
          Expanded(child: Text('$targetWeight lb', textAlign: TextAlign.right)),
        ],
      ),
    ),
  );
}

class ExerciseWidget extends StatefulWidget {
  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      padding: const EdgeInsets.all(_padding),
      child: FlutterLogo(),
    );
  }
}
