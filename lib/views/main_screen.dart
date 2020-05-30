import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'main_pages/home.dart';
import 'main_pages/history.dart';
import 'main_pages/settings.dart';

class MainScreenView extends StatefulWidget {
  @override
  _MainScreenViewState createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
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
