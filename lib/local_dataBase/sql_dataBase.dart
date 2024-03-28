import 'dart:async';

import 'package:learning_flutter/local_dataBase/notes_app/domain/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDataBase {
   Database? _dataBase;

  Future<Database> get getDataBase async {
    _dataBase ??= await initialDataBase();
    return _dataBase!;
  }

  Future<Database> initialDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'notes.db');
    Database myLocalDataBase = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return myLocalDataBase;
  }

  FutureOr<void>? _onUpgrade(
      Database database, int oldVersion, int newVersion) {
    database.execute(
        'ALTER TABLE notes ADD COLUMN color2 TEXT');
    print(
        'dummyDataBase update  old version$oldVersion and new version $newVersion');
  }

  FutureOr<void>? _onCreate(Database database, int version) {
    database.execute(
        // 'CREATE TABLE dummyDataBase (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,name TEXT NOT NULL ,age TEXT NOT NULL,gender TEXT NOT NULL)'
    'CREATE TABLE notes (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,title TEXT NOT NULL ,description TEXT NOT NULL, color TEXT NOT NULL)'
    );
    print('version is${version}');
    database.setVersion(version);
    print("dummy dataBase notes.db is Created ");
  }

  Future<List<Map<String, dynamic>>> readData() async {
    try {
      String sqlRead = "SELECT * FROM 'notes'";
      Database database = await getDataBase;
      final response = await database.rawQuery(sqlRead);

      return response;
    } catch (e) {
      return [];
    }
  }

  Future<int> insertData(NotesModel model) async {
    String sqlInsert =
        'INSERT INTO notes(title, description,color) VALUES("${model.title}","${model.description}","${model.color.name}")';
    Database database = await getDataBase;

    try {
      final response = await database.rawInsert(sqlInsert);
      return response;
    } catch (e) {
      return 0;
    }
  }

  Future<int> updateData() async {
    String sqlUpdate = "SELECT * FROM 'notes'";

    Database database = await getDataBase;
    final response =await database.rawUpdate(sqlUpdate);
    return response;
  }

  Future<int> deleteData({required int id}) async {
    String sqlDelete = "DELETE  FROM 'notes' WHERE id=$id";

    Database database = await getDataBase;
    final response =await database.rawDelete(sqlDelete);
    return response;
  }

  Future<void> deleteTable({required String tableName}) async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, tableName);
    await deleteDatabase(path);
  }
}
enum Gender { male, female }