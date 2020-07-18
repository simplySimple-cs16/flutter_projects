import 'package:flutter/material.dart';
import 'package:days/time_diff.dart';
import 'dart:async';
import 'add_target_screen.dart';
import 'package:provider/provider.dart';
import 'package:days/models/target_list.dart';
import 'package:days/models/target.dart';
import 'package:sqflite/sqflite.dart';
import 'package:days/utils/database_helper.dart';
import 'target_detail.dart';

class TargetsScreen extends StatefulWidget {
  @override
  _TargetsScreenState createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  TimeDiff timeDiff = new TimeDiff();
  String targetTitle, targetDate, targetTime;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Target> targetList;
  int count = 0;

  TargetList targetListClass = TargetList();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (targetList == null) {
      targetList = List<Target>();
      updateListView();
    }

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
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  var target = this.targetList[index];
                  return Card(
                    color: Colors.greenAccent,
                    elevation: 2.0,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(target.targetTitle),
                          Row(
                            children: <Widget>[
                              Text('Time Left : '),
                              Text(targetListClass.getTimeLeft(target)),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          _delete(context, target);
                        },
                      ),
                      onTap: () {
                        navigateToDetail(target);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add a deadline",
          backgroundColor: Colors.pinkAccent,
          child: Icon(Icons.add),
          onPressed: () {
            Target target;
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTargetScreen((targetObject) {
                    _save(targetObject);
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //save to database
  void _save(Target target) async {
    Navigator.pop(this.context);

    int result;
    if (target.id != null) {
      //i.e it is already in the db so we need to update

      result = await databaseHelper.updateTarget(target);
    } else {
      //insert it to db
      result = await databaseHelper.insertTarget(target);
    }

    if (result != 0) {
      //success
      _showAlertDialog('Status', 'Target Saved Successfully!');
    } else {
      //failure
      _showAlertDialog('Status', 'Failed to Save Target!');
    }
    updateListView();
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: this.context, builder: (_) => alertDialog);
  }

  void _delete(BuildContext context, Target target) async {
    int result = await databaseHelper.deleteTarget(target.id);
    if (result != 0) {
      _showSnackBar(context, 'Target Deleted Successfully');
      //Todo update the list view
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void navigateToDetail(Target target) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TargetDetail(target);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Target>> targetListFuture = databaseHelper.getTargetList();
      targetListFuture.then((targetList) {
        setState(() {
          this.targetList = targetList;
          this.count = targetList.length;
        });
      });
    });
  }
}
