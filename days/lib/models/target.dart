import 'package:flutter/cupertino.dart';

class Target {
  int id;
  String targetTitle;
  DateTime targetDate;

  Target({this.id, @required this.targetTitle, @required this.targetDate});

  //convert a target object into map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['targetTitle'] = targetTitle;
    map['targetDate'] = targetDate.toIso8601String();
    return map;
  }

  //Extract a note object from a map object
  Target.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.targetTitle = map['targetTitle'];

    DateTime parsedDate = DateTime.parse(map['targetDate']);
    this.targetDate = parsedDate;
  }
}
