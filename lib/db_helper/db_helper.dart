import 'dart:io' as io;
import 'package:adsf/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  // Singleton Database
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  // Initialize Database
  Future<Database> initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Table Creation
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        age INTEGER,
        description TEXT NOT NULL,
        email TEXT
      )
    ''');
  }

  // INSERT
  Future<int> insertNote(NotesModel note) async {
    final dbClient = await db;
    return await dbClient.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // GET ALL NOTES
  Future<List<NotesModel>> getNotesList() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('notes');

    return List.generate(
      maps.length,
          (i) => NotesModel.fromMap(maps[i]),
    );
  }

  // DELETE NOTE
  Future<int> deleteNote(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // UPDATE NOTE
  Future<int> updateNote(NotesModel note) async {
    final dbClient = await db;
    return await dbClient.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
