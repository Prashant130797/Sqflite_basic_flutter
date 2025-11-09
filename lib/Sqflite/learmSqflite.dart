import 'package:flutter/material.dart';
import 'package:learn_provider/Sqflite/DB_Helper.dart';
import 'package:learn_provider/Sqflite/dbModel.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';

class DartNewSqfliState extends StatefulWidget {
  const DartNewSqfliState({super.key});

  @override
  State<DartNewSqfliState> createState() => __DartNewSqfliStateState();
}

class __DartNewSqfliStateState extends State<DartNewSqfliState> {
  Future<Database> _initlizeDatabase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'students.db');
    print("The path is $path");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE students(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          age INTEGER
        )
      ''');
      },
    );
  }

  Future<void> inserdata(String name, int age) async {
    final db = await _initlizeDatabase();
    await db.insert('students', {
      "name": name,
      "age": age,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await _initlizeDatabase();
    return await db.query('students');
  }

  Future<void> updateStudent(StudentModel student) async {
    final db = await _initlizeDatabase();
    await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  @override
  void initState() {
    _initlizeDatabase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  inserdata("omkar", 19);
                });
              },
              child: Container(
                color: Colors.amber,
                child: Center(child: Text('INSERT')),
                height: 10.h,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            //====>>>.
            GestureDetector(
              onTap: () async {
                List<Map<String, dynamic>> getdblist = await getStudents();
                var Listes = StudentModelDemo.fromMap(getdblist);
                print("the listed is ${Listes.getdblist}");
                List<StudentModel> dfd = List.generate(
                  getdblist.length,
                  (i) => StudentModel.fromMap(getdblist[i]),
                );
                for (var i in dfd) {
                  print(
                    "The list of the student is ${i.age} ${i.name} ${i.id}",
                  );
                }
              },
              child: Container(
                color: Colors.red,
                height: 10.h,
                child: Center(child: Text('FETCH')),

                width: MediaQuery.of(context).size.width,
              ),
            ),
            //====>>>
            GestureDetector(
              onTap: () async {
                var dbhelper = DatabaseHelper.instance;
                print("dbhelper ==> ${dbhelper.database}");
                dbhelper.updateStudentName(1, "Karthik");
              },
              child: Container(
                color: Colors.pink,
                height: 10.h,
                child: Center(child: Text('FETCH')),

                width: MediaQuery.of(context).size.width,
              ),
            ),
            //========>>>>
            GestureDetector(
              onTap: () async {
                var dbhelper = DatabaseHelper.instance;
                print("dbhelper ==> ${dbhelper.database}");
                dbhelper.deleteStudent("Karthiks");
              },
              child: Container(
                color: Colors.green,
                height: 10.h,
                child: Center(child: Text('Delete')),

                width: MediaQuery.of(context).size.width,
              ),
            ),
            //==========>>>
              GestureDetector(
              onTap: () async {
                var dbhelper = DatabaseHelper.instance;
                dbhelper.paticulardata("prashant");
              },
              child: Container(
                color: Colors.purple,
                height: 10.h,
                child: Center(child: Text('Fetch and Update Paticular')),

                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
