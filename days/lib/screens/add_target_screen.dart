import 'package:days/models/target.dart';
import 'package:days/time_diff.dart';
import 'package:days/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:days/models/target_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:instant/instant.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddTargetScreen extends StatefulWidget {
  final Function addTargetCallback;
  AddTargetScreen(this.addTargetCallback);
  @override
  _AddTargetScreenState createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
  String targetTitle = 'Not Set', date = 'Not Set', time = 'Not Set';
  List<String> day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> month = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  var currentDate = dateTimeToZone(zone: 'IST', datetime: DateTime.now());
  int y, m, d, hr, min;
  DateTime targetDate;

  //Database Section
  DatabaseHelper helper = DatabaseHelper();

  Target target;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var hundredYearsFromNow = now.add(new Duration(days: 36525));

    /*y = currentDate.year;
    m = currentDate.month;
    d = currentDate.day;
    hr = currentDate.hour;
    min = currentDate.minute;
    date = '${day[currentDate.weekday - 1]} $d ${month[m - 1]} $y';
    String amOrPm = (currentDate.hour > 11) ? 'PM' : 'AM';
    String hour;
    if (currentDate.hour == 0) {
      hour = '12';
    } else if (currentDate.hour > 12) {
      hour = (currentDate.hour - 12).toString();
    } else {
      hour = currentDate.hour.toString();
    }

    time = '$hour:${currentDate.minute} $amOrPm';*/

    return Container(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          Text('Title'),
          TextField(
            onChanged: (value) {
              targetTitle = value;
            },
          ),
          SizedBox(
            height: 50.0,
          ),
          //date container
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('$date'),
                  ],
                ),
                FlatButton(
                  color: Colors.pinkAccent,
                  child: Text(
                    'Set Date',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: now,
                        maxTime: hundredYearsFromNow, onConfirm: (newDate) {
                      date =
                          '${day[newDate.weekday - 1]} ${newDate.day} ${month[newDate.month - 1]} ${newDate.year}';

                      y = newDate.year;
                      m = newDate.month;
                      d = newDate.day;
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          //time container
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('$time'),
                  ],
                ),
                FlatButton(
                  color: Colors.pinkAccent,
                  child: Text(
                    'Set Time',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onConfirm: (newTime) {
                      String amOrPm = (newTime.hour > 11) ? 'PM' : 'AM';
                      String hour;
                      if (newTime.hour == 0) {
                        hour = '12';
                      } else if (newTime.hour > 12) {
                        hour = (newTime.hour - 12).toString();
                      } else {
                        hour = newTime.hour.toString();
                      }

                      hr = newTime.hour;
                      min = newTime.minute;

                      time = '$hour:${newTime.minute} $amOrPm';
                      setState(() {});
                    }, currentTime: DateTime.now());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          FlatButton(
            color: Colors.greenAccent,
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () async {
              //Wrong Code
              /*TargetList().addTarget(
                targetTitle: targetTitle,
                date: date,
                time: time,
              );*/

              String m1 = (m < 10) ? '0$m' : '$m';
              String d1 = (d < 10) ? '0$d' : '$d';
              String hr1 = (hr < 10) ? '0$hr' : '$hr';
              String min1 = (min < 10) ? '0$min' : '$min';
              targetDate = DateTime.parse('${y.toString()}-$m1-$d1 $hr1:$min1');

              print('Target Date  = $targetDate');
              print('Current Date = $currentDate');
              print('$date $time');
              String timeLeft = TimeDiff().getDiff(currentDate, targetDate);

              /* Provider.of<TargetList>(context).addTarget(
                targetTitle: targetTitle,
                targetDate: targetDate,
              );*/
              target = Target(targetTitle: targetTitle, targetDate: targetDate);

              widget.addTargetCallback(target);
            },
          )
        ],
      ),
    );
  }
}
