import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter_application_1/model_data.dart';


class DatabaseProvider {
  final databaseName = "todo.db";
  static Database? database;
  DatabaseProvider() {
    print("in constructor");
    createDatabase();
  }
  Future<Database> createDatabase() async {
    if (kIsWeb) {
      var databaseFactory = databaseFactoryFfiWeb;
      database = await databaseFactory.openDatabase(databaseName,
          options: OpenDatabaseOptions(
              version: 1,
              onCreate: (db, version) async {
                await db!.execute(
                    'CREATE TABLE Test (id INTEGER PRIMARY KEY,fooodname TEXT, price INTEGER)');
              }));
    } else {
      String path = join(await getDatabasesPath(), databaseName);
      database =
          await openDatabase(path, version: 1, onCreate: (db, version) async {
        await db!.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, foodname TEXT, price INTEGER)');
      });
    }
    return Future.value(database);
  }

  Future<void> insertTodo(Model model) async {
    var db = await createDatabase();
    db.insert("Test", model.toMap());
  }

  Future<void> updateTodo(Model model) async {
    var db = await createDatabase();
    db.update("Test", model.toMap(),
        where: "id=?", whereArgs: [model.id]);
  }

  Future<void> deleteTodo(int id) async {
    var db = await createDatabase();
    db.delete("Test", where: "id=?", whereArgs: [id]);
  }

  Future<List<Model>> getList() async {
    var db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query("Test");

    return List.generate(maps.length, (i) {
      return Model.fromJson(maps[i]);
    });
  }
}