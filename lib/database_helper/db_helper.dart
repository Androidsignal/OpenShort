import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'generateKey.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE generateKey(name TEXT, email TEXT , key TEXT,dateTime TEXT )');
        }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(table, data);
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }

}