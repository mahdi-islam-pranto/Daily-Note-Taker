// // Note model class
// import 'package:daily_note/database/sqlite_service.dart';

// class Note {
//   final int id;
//   final String title;
//   final String content;
//   final String createdAt;

//   Note(
//       {required this.id,
//       required this.title,
//       required this.content,
//       required this.createdAt});

//   Map<String, dynamic> toMap() {
//     return {
//       DatabaseHelper.colTitle: title,
//       DatabaseHelper.colContent: content,
//       DatabaseHelper.colCreatedAt: createdAt,
//     };
//   }

//   factory Note.fromMap(Map<String, dynamic> map) {
//     return Note(
//       id: map[DatabaseHelper.colId],
//       title: map[DatabaseHelper.colTitle],
//       content: map[DatabaseHelper.colContent],
//       createdAt: map[DatabaseHelper.colCreatedAt],
//     );
//   }
// }
