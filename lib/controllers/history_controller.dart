import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/historic_log.dart';
import 'package:flutter_earthquakes/models/search_params.dart';

class LogHistoryController extends ChangeNotifier {

  final List<Log> _historic_items = [];

  UnmodifiableListView<Log> get items => UnmodifiableListView(_historic_items);
  
  void addLog(String magnetude, String day){
    Log newLog = _createLog(magnetude, day);

    _addLogToDatabase(newLog);
    _addLogToList(newLog);
  }

  void _addLogToList(Log newLog){
    _historic_items.add(newLog);
  }

  void _addLogToDatabase(Log newLog){
  }

  void _deleteAllLogsFromDatabase(){
  }

  void resetHistory(){
    _historic_items.clear();
  }

  Log _createLog(String magnetude, String day){
    DateTime dataAtual = DateTime.now();
    String formatedData = DateFormat('yyyy-MM-dd HH:mm').format(dataAtual);

    Log log = Log(magnetude: magnetude, day: day, data: formatedData);
    return log;
  }

}