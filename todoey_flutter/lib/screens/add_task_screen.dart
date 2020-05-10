import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(
          0xff757575), //uncomment to know why a second child has to be defined
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.red, //uncomment to know why a second child has to be defined
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(),
            FlatButton(),
          ],
        ),
      ),
    );
  }
}
