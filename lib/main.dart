import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'views/home.dart';
import 'views/history.dart';
import 'views/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _appbarTitle = 'SS / SL Workout Tracker';
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 16.0)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appbarTitle, style: TextStyle(fontSize: 24.0)),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Center(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _pageIndex = index);
            },
            children: <Widget>[
              HomeView(),
              HistoryView(),
              SettingsView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _pageIndex,
          onItemSelected: (index) {
            setState(() => _pageIndex = index);
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 270), curve: Curves.ease);
          },
          backgroundColor: Colors.transparent,
          showElevation: false,
          curve: Curves.ease,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          items: [
            buildBottomNavyBarItem(Icons.home, 'HOME'),
            buildBottomNavyBarItem(Icons.history, 'HISTORY'),
            buildBottomNavyBarItem(Icons.settings, 'SETTINGS'),
          ],
        ),
      ),
    );
  }

  BottomNavyBarItem buildBottomNavyBarItem(IconData iconData, String title) {
    return BottomNavyBarItem(
      icon: Icon(iconData),
      title: Text(title),
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      textAlign: TextAlign.center,
    );
  }
}
