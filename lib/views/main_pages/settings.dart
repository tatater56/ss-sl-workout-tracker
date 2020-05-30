import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final Color _mainColor = Colors.grey[900];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _mainColor,
      child: SafeArea(
        child: Center(child: Text('settings')),
      ),
    );
  }
}