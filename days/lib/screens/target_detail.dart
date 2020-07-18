import 'package:days/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:days/models/target.dart';

class TargetDetail extends StatefulWidget {
  final Target target;
  TargetDetail(this.target);

  @override
  _TargetDetailState createState() => _TargetDetailState(this.target);
}

class _TargetDetailState extends State<TargetDetail> {
  Target target;
  _TargetDetailState(this.target);

  TextEditingController textEdit = TextEditingController();

  //Database Section
  DatabaseHelper helper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    textEdit.text = target.targetTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Target'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, right: 10, left: 10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: textEdit,
                onChanged: (value) {
                  updateTitle();
                  //debugPrint(value);
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _save(target);
                          debugPrint('Hello from Save button');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
//                          debugPrint('Hello from Delete button');
                          _delete(target);
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //update the title of a target
  void updateTitle() {
    target.targetTitle = textEdit.text;
  }

  //save to database
  void _save(Target target) async {
    Navigator.pop(context, true);

    int result;
    if (target.id != null) {
      //i.e it is already in the db so we need to update

      result = await helper.updateTarget(target);
    } else {
      //insert it to db
      result = await helper.insertTarget(target);
    }

    if (result != 0) {
      //success
      _showAlertDialog('Status', 'Target Saved Successfully!');
    } else {
      //failure
      _showAlertDialog('Status', 'Failed to Save Target!');
    }
  }

  //delete from database
  void _delete(Target target) async {
    Navigator.pop(context, true);

    int result = await helper.deleteTarget(target.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Target Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occurred While Deleting Target');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
}
