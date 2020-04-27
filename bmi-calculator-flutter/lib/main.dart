import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //copyWith is to add some customization
        primaryColor: Color(0xFF111639), //applies to app bars etc
        scaffoldBackgroundColor: Color(0xFF0C1134),
      ),
      home: InputPage(),
    );
  }
}
