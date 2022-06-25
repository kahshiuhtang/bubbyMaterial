import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/objective.dart';
import '../models/person.dart';

class DatabaseHelper {
  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'objectives.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    final sql =
        'CREATE TABLE objectives(id INTEGER PRIMARY KEY, title TEXT, description TEXT, points INTEGER)';
    await db.execute(sql);
  }

  static Future<void> insertObjective(Objective objective) async {
    Database _db = await DatabaseHelper.initDB();
    await _db.insert('objectives', objective.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  static Future<void> updateObjectiveTitle(int id, String title) async {
    Database _db = await DatabaseHelper.initDB();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  static Future<void> updateObjectiveDescription(
      int id, String description) async {
    Database _db = await DatabaseHelper.initDB();
    await _db.rawUpdate(
        "UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<List<Objective>?> getObjectives() async {
    Database _db = await DatabaseHelper.initDB();
    List<Map<String, dynamic>> objectiveMap = await _db.query('objectives');
    return List.generate(objectiveMap.length, (index) {
      return Objective(
          id: objectiveMap[index]['id'],
          title: objectiveMap[index]['title'],
          points: objectiveMap[index]['points'],
          description: objectiveMap[index]['description']);
    });
  }
}
