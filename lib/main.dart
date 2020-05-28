import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appbarTitle = "SS/SL Tracker";
  int _pageIndex = 0;
  PageController _pageController;
  List<Color> _appColor = [Colors.red[900], Colors.blue[900], Colors.orange[900]];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: _appColor[_pageIndex]),
      home: Scaffold(
        appBar: AppBar(title: Text(_appbarTitle), elevation: 0, backgroundColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Center(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _pageIndex = index);
            },
            children: <Widget>[
              for(int i in [0,1,2])
                Container(color: _appColor[i])
            ],
          ),
        ),

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _pageIndex,
          onItemSelected: (index) {
            setState(() => _pageIndex = index);
            _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
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