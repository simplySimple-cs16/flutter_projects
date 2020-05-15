import 'package:flutter/material.dart';
import 'package:days/models/target_list.dart';
import 'package:provider/provider.dart';

class AddTargetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String targetTitle, date, time;

    return Container(
      child: Column(
        children: <Widget>[
          Text('Title'),
          TextField(
            onChanged: (value) {
              targetTitle = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          //Todo : replace by button
          Text('Set Date'),
          TextField(
            onChanged: (value) {
              date = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          //Todo : replace by button
          Text('Set Time'),
          TextField(
            onChanged: (value) {
              time = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              //Wrong Code
              /*TargetList().addTarget(
                targetTitle: targetTitle,
                date: date,
                time: time,
              );*/
              Provider.of<TargetList>(context).addTarget(
                targetTitle: targetTitle,
                date: date,
                time: time,
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
