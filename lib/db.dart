import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initilizaeDatabae() async {
  // get the path for our database .
  var path = await getDatabasesPath();
  
  // open my database
  Future<Database> db = openDatabase(join(path, 'counters.db'),
  onCreate: (db, version) {
    return db.execute('CREATE TABLE COUNTERS(ID INTEGER PRIMARY KEY AUTOINCREMENT, VALUE INTEGER)');
  },
  version: 1
  );
  print('..........database has been created and the table has been added................');
  return db;
}