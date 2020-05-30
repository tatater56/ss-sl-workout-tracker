import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final Color _mainColor = Colors.blue[900];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _mainColor,
      child: SafeArea(
        child: Center(child: Text('history')),
      ),
    );
  }
}