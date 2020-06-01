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
                  ExerciseWidget(),
                  SizedBox(height: _margins),
                  ExerciseWidget(),
                ],
              )),
        ),
      ),
    );
  }
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
