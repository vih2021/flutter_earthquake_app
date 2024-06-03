import 'package:flutter_earthquakes/models/database_connection.dart';
import 'package:sqflite/sqflite.dart';
import 'log.dart';

class DatabasePersistence{

  final _database = DatabaseConnection.getInstance;

  Future<void> insertLog(Log log) async{
    int? rowsCreated = await _database.insert('history_log',
      log.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail
    );

    if (rowsCreated <= 0){
      throw Exception("Não foi possível salvar os dados no banco");
    }
  }

  Future<void> deleteAllLogs() async{
    int? rowsDeleted = await _database.delete('history_log');

      if (rowsDeleted <= 0){
      throw Exception("Não foi possível excluir os registros");
    }
  }

  Future<List<Map<String, Object?>>> getLogs() async{
    final List<Map<String,Object?>> logMaps = await _database.query('history_log');

    if(logMaps.isEmpty){
      throw Exception("Não foi possível buscar os registros");
    }

    return await logMaps;
  }

}