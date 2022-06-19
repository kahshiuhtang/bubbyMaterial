import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/objective.dart';
import '../models/person.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(join(await getDatabasesPath(), 'objectives.db'),
        onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE objectives(id INTEGER PRIMARY KEY, title TEXT, description TEXT, points INTEGER)',
      );
    });
  }

  Future<void> insertObjective(Objective objective) async {
    Database _db = await database();
    await _db.insert('objectives', objective.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<void> updateObjectiveTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateObjectiveDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<List<Objective>> getObjectives() async {
    Database _db = await database();
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
