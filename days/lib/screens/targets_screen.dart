import 'package:flutter/material.dart';
import 'package:days/time_diff.dart';
import 'dart:async';
import 'add_target_screen.dart';
import 'package:days/widgets/target_tile.dart';
import 'package:provider/provider.dart';
import 'package:days/models/target_list.dart';

class TargetsScreen extends StatefulWidget {
  @override
  _TargetsScreenState createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  TimeDiff timeDiff = new TimeDiff();
  String targetTitle, targetDate, targetTime;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Days',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Consumer<TargetList>(
                builder: (context, targetList, child) {
                  return ListView.builder(
                    itemCount: targetList.targetsCount,
                    itemBuilder: (context, index) {
                      return TargetTile(
                        targetTitle: targetList.targets[index].targetTitle,
                        timeLeft: targetList.targets[index].timeLeft,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTargetScreen(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
