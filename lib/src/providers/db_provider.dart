import 'dart:io';
import 'package:api_to_sqlite/src/models/personajes_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Personajes table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'employee_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Personajes('
          'id INTEGER PRIMARY KEY,'
          'first_name TEXT,'
          'real_name TEXT,'
          'image TEXT'
          ')');
    });
  }

  // Insert Personajes on database
  createPersonajes(Personajes newPersonajes) async {
    // await deleteAllPersonajes();
    final db = await database;
    final res = await db?.insert('Personajes', newPersonajes.toJson());

    return res;
  }

  // Delete all Personajes
  Future<int?> deleteAllPersonajes() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Personajes');

    return res;
  }

  Future<List<Personajes?>> getAllPersonajes() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Personajes");

    List<Personajes> list =
        res!.isNotEmpty ? res.map((c) => Personajes.fromJson(c)).toList() : [];

    return list;
  }
}
