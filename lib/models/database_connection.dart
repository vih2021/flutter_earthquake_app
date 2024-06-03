import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {

  static late Database _database;
  
  static void init(){
    WidgetsFlutterBinding.ensureInitialized();
    _openDatabase();
  }

  static Database get getInstance {
    return _database;
  }

  static void _openDatabase() async{
    _database = await openDatabase(
    join(await getDatabasesPath(), 'history_log.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE history_log(magnetude VARCHAR(20), day VARCHAR(20), data VARCHAR(20))',
      );
    },
    version: 1,
    );
  }
  
}