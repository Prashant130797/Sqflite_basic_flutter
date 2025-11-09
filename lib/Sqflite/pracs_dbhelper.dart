import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PracsDbhelper {
  PracsDbhelper._init();
  static final PracsDbhelper instance = PracsDbhelper._init();
  static Database? _dbasel;

  Future<Database> get database async {
    if (_dbasel != null) return _dbasel!;
    _dbasel = await initmethod("staudents.db");
    return _dbasel!;
  }

  Future<Database>? initmethod(String database) async {
    final getpath = await getDatabasesPath();
    final pathMain = join(getpath, database);
    return openDatabase(pathMain, onCreate: onCretadDatabase);
  }

  Future onCretadDatabase(Database databaseMain, int version) async {
    await databaseMain.execute('''
        CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL)
      ''');
  }

  Future<int> updatedb(String name, int id) async {
    final dbinstance = await instance.database;
    return await dbinstance.update(
      "students",
      {"name": name},
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
