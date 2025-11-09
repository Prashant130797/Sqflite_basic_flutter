class StudentModel {
  int id;
  String name;
  int age;
  StudentModel(this.id, this.age, this.name);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(map["id"], map["age"], map["name"]);
  }
}

//  List<Map<String, dynamic>>? getdblist;

class StudentModelDemo {
  List<Map<String, dynamic>>? getdblist;
  StudentModelDemo(this.getdblist);

  // Map<String, dynamic> toMap() {
  //   return {'id': id, 'name': name, 'age': age};
  // }

  factory StudentModelDemo.fromMap(List<Map<String, dynamic>> map) {
    return StudentModelDemo(map);
  }
}
