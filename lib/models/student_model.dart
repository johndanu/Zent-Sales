class Student {
  String? key;
  StudentData? studentData;

  Student({this.key, this.studentData});
}

class StudentData {
  String? name;
  String? age;
  String? subject;
  String? institute;

  StudentData({this.name, this.age, this.subject, this.institute});

  StudentData.fromJson(Map<dynamic, dynamic> json) {
    name = json["name"];
    age = json["age"];
    subject = json["subject"];
    institute = json["institute"];
  }
}
