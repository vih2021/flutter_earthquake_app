import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_earthquakes/models/database_persistence.dart';
import 'package:intl/intl.dart';
import '../models/log.dart';

class LogHistoryController extends ChangeNotifier {

  late DatabasePersistence database;
  final List<Log> _historic_items = [];
  static LogHistoryController? _instance;
  
  LogHistoryController(){
      database = DatabasePersistence();
  }

  static LogHistoryController? get instance {
    if (_instance == null) {
      _instance = LogHistoryController();
    }
    
    return _instance;
  }

  UnmodifiableListView<Log> get items => UnmodifiableListView(_historic_items);
  
  void addLog(String magnetude, String day){
    Log newLog = _createLog(magnetude, day);

    database.insertLog(newLog);
    _historic_items.add(newLog);
  }

  Future<void> loadHistoryLogs() async{ 

   List<Map<String,Object?>> logs = await database.getLogs();

    for(final log in logs){
      _historic_items.add(Log.fromMap(log));
    }
    
  }

  void deleteAllLogs(){
    //database.deleteAllLogs();
    _historic_items.clear();
  }

  Log _createLog(String magnetude, String day){
    DateTime dataAtual = DateTime.now();
    String formatedData = DateFormat('yyyy-MM-dd HH:mm').format(dataAtual);

    Log log = Log(magnetude: magnetude, day: day, data: formatedData);
    return log;
  }

}