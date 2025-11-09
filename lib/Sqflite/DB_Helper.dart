import 'package:learn_provider/Sqflite/dbModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertStudent(StudentModel student) async {
    final db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<List<StudentModel>> getStudents() async {
    final db = await instance.database;
    final result = await db.query('students');
    return result.map((map) => StudentModel.fromMap(map)).toList();
  }

  /// ✅ UPDATE STUDENT NAME
  Future<int> updateStudentName(int id, String newName) async {
    final db = await instance.database;
    return await db.update(
      'students',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(String name) async {
    final db = await instance.database;
    return await db.delete('students', where: 'name = ?', whereArgs: [name]);
  }

  Future<void> paticulardata(String name) async {
    final db = await instance.database;
    var getxss = await db.query(
      'students',
      where: "name = ?",
      whereArgs: [name],
    );
    print("the getxxx is $getxss");
  }
}

//db.execute = use to create a table 
//db.query = fetch all records
//db.update = update the records
//db.delete = delete the paticular record
