class Student {
  String? key;
  StudentData? studentData;

  Student({this.key, this.studentData});
}

class StudentData {

  String? institute;
  String? owner;


  StudentData({ this.institute,this.owner});

  StudentData.fromJson(Map<dynamic, dynamic> json) {

    institute = json["institute"];
    owner = json["owner"];

  }
}
