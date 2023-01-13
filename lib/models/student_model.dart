class Student {
  String? key;
  StudentData? studentData;

  Student({this.key, this.studentData});
}

class StudentData {
  String? institute;
  String? owner;
  String? ownernum;
  String? contentCollection;

  StudentData(
      {this.institute, this.owner, this.ownernum, this.contentCollection});

  StudentData.fromJson(Map<dynamic, dynamic> json) {
    institute = json["institute"];
    owner = json["owner"];
    ownernum = json["ownernum"];
    contentCollection = json["contentCollection"];
  }
}
