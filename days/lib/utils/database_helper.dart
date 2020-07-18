import 'dart:io';
import 'package:async/async.dart';
import 'package:days/models/target.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton databaseHelper object
  static Database _database; //singleton database object

  String daysTable = 'days_table';
  String colId = 'id';
  String colTargetTitle = 'targetTitle';
  String colTargetDate = 'targetDate';

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //function for initializing the database
  Future<Database> initializeDatabase() async {
    //Get the directory path for both Android and iOS to store database
    String directory = await getDatabasesPath();
    String path = directory + 'days.db';

    //Open/create the database at a given path
    var daysDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return daysDatabase;
  }

  //function for creating the database
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $daysTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTargetTitle TEXT, $colTargetDate TEXT)');
  }

  //Fetch Operation: Get all days objects database
  Future<List<Map<String, dynamic>>> getTargetsToMapList() async {
    Database db = await this.database;
    //var result = await db.rawQuery('SELECT * FROM $daysTable');
    var result = await db.query(daysTable);
    return result;
  }

  //Insert Operation : Insert a Target object to the database
  Future<int> insertTarget(Target target) async {
    Database db = await this.database;
    var result = await db.insert(daysTable, target.toMap());
    return result;
  }

  //Update Operation: Update a Target object and save it to the database
  Future<int> updateTarget(Target target) async {
    Database db = await this.database;
    var result = db.update(daysTable, target.toMap(),
        where: '$colId=?', whereArgs: [target.id]);
    return result;
  }

  //Delete Operation: Delete a Target object from the database
  Future<int> deleteTarget(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $daysTable WHERE $colId=$id');
    return result;
  }

  //Get number of Target Objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $daysTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //Get the 'Map List'(List<Map>) and convert it to 'Target List'(List<Target>)
  Future<List<Target>> getTargetList() async {
    var targetMapList =
        await getTargetsToMapList(); //get 'Map List' from database
    int count = targetMapList.length; //number of targets in db

    List<Target> targetList = List<Target>();
    for (int i = 0; i < count; i++) {
      targetList.add(Target.fromMapObject(targetMapList[i]));
    }
    return targetList;
  }
}
