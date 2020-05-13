import 'package:days/screens/targets_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Days());

class Days extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: TargetsScreen(),
    );
  }
}
