// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class NoteDatabase {
//   static final NoteDatabase instance = NoteDatabase._internal();

//   static Database? _database;

//   NoteDatabase._internal();

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }

//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final path = '$databasePath/notes.db';
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDatabase,
//     );
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     return await db.execute('''
//         CREATE TABLE ${DiaryField.tableName} (
//         ${DiaryField.id} ${DiaryField.idType},
//         ${DiaryField.user} ${DiaryField.boolType},
//         ${DiaryField.message} ${DiaryField.textType},
//         )
//       ''');
//   }

//   Future<void> create(DiaryModel entry) async {
//     final db = await instance.database;
//     final id = await db.insert(DiaryField.tableName, entry.toJson());
//     return entry.copy(id: id);
//   }
// }

// class DiaryField {
//   static const String tableName = 'diary';
//   static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//   static const String textType = 'TEXT NOT NULL';
//   static const String boolType = 'BOOLEAN NOT NULL';
//   static const String intType = 'INTEGER NOT NULL';
//   static const String id = '_id';
//   static const String user = 'user';
//   static const String message = 'message';
// }

// class DiaryModel {
//   final int? id;
//   final bool user;
//   final String message;
//   DiaryModel({
//     required this.id,
//     required this.user,
//     required this.message,
//   });
//   // Map<String, Object?> toJson() => {
//   //       DiaryModel.id: id,
//   //       DiaryModel.message: message,
//   //       DiaryModel.user: user ? 1 : 0,
//   //       DiaryModel.createdTime: createdTime?.toIso8601String(),
//   //     };
// }
