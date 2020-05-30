import 'package:flutter/material.dart';
import 'package:ss_sl_workout_tracker/views/main_screen.dart';

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
      home: MainScreen(),
      routes: {
        // "/splash": (_) => Splash(),
        // "/workout": (_) => Workout(),
        "/main_screen": (_) => MainScreen(),
      },
    );
  }
}
