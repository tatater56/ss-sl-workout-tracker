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
  final String _appbarTitle = "SS/SL Tracker";
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
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appbarTitle),
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
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          backgroundColor: Colors.transparent,
          showElevation: false,
          items: [
            buildBottomNavyBarItem(Icons.home, "Home"),
            buildBottomNavyBarItem(Icons.history, "History"),
            buildBottomNavyBarItem(Icons.settings, "Settings"),
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
