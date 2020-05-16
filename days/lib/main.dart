import 'package:days/models/target_list.dart';
import 'package:days/screens/targets_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Days());

class Days extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TargetList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ThemeData(primarySwatch: Colors.teal),
        home: TargetsScreen(),
      ),
    );
  }
}
