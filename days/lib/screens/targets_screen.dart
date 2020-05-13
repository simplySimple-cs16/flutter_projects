import 'package:flutter/material.dart';
import 'package:days/time_diff.dart';
import 'dart:async';

class TargetsScreen extends StatefulWidget {
  @override
  _TargetsScreenState createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  TimeDiff timeDiff = new TimeDiff();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Days',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[ListView],
        ),
      ),
    );
  }
}
