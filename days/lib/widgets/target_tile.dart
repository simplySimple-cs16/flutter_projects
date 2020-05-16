import 'package:flutter/material.dart';

class TargetTile extends StatelessWidget {
  final String targetTitle, timeLeft;
  TargetTile({@required this.targetTitle, @required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(targetTitle),
          Row(
            children: <Widget>[
              Text('Time Left : '),
              Text(timeLeft),
            ],
          ),
        ],
      ),
    );
  }
}
