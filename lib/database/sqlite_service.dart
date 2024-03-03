import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/note.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  // Private constructor for singleton
  DatabaseHelper._internal();

  // Database name
  static const String _dbName = 'notes.db';

  // Database version
  static const int _dbVersion = 1;

  // Table name
  static const String _tableName = 'notes';

  // Columns for the notes table
  static const String colId = 'id';
  static const String colTitle = 'title';
  static const String colContent = 'content';
  static const String colCreatedAt = 'createdAt';

  // Open the database connection
  Future<Database> _getDatabase() async {
    return await databaseFactory.openDatabase(_dbName, version: _dbVersion,
        onCreate: (db, version) {
      db.execute('''
          CREATE TABLE $_tableName (
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colTitle TEXT NOT NULL,
            $colContent TEXT NOT NULL,
            $colCreatedAt TEXT NOT NULL
          )
          ''');
    });
  }

  // Create a new note
  Future<int> insertNote(Note note) async {
    final db = await _getDatabase();
    return await db.insert(_tableName, note.toMap());
  }

  // Get all notes
  Future<List<Note>> getNotes() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  // Update a note
  Future<int> updateNote(Note note) async {
    final db = await _getDatabase();
    return await db.update(_tableName, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
  }

  // Delete a note
  Future<int> deleteNote(int id) async {
    final db = await _getDatabase();
    return await db.delete(_tableName, where: '$colId = ?', whereArgs: [id]);
  }
}
