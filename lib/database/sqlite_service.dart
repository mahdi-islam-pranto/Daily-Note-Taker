import 'package:daily_note/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteRepo {
  static const _dbName = 'note_database.db';
  static const _tableName = 'notes';

  Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  insert({required Note note}) async {
    final db = await _database();

    await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> getNotes() async {
    final db = await _database();

    // Query the table for all the notes.
    final List<Map<String, Object?>> noteMaps = await db.query(_tableName);

    // Convert the list of each notes's fields into a list of `Note` objects.
    return [
      for (final {
            'id': id as int,
            'title': title as String,
            'description': description as String,
            'createdAt': createdAt as DateTime
          } in noteMaps)
        Note(
            id: id,
            title: title,
            description: description,
            createdAt: createdAt),
    ];
  }
}
