import 'package:flutter/material.dart';

import 'views/main_screen.dart';
import 'views/workout.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 20.0)),
      ),
      debugShowCheckedModeBanner: false,
      title:  "SS/SL Workout Tracker",
      home: MainScreenView(),
      routes: {
        // "/splash": (_) => Splash(),
        "/workout": (_) => WorkoutView(),
        "/main_screen": (_) => MainScreenView(),
      },
    );
  }
}
