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
  String? province;

  StudentData(
      {this.institute,
      this.owner,
      this.ownernum,
      this.contentCollection,
      this.province});

  StudentData.fromJson(Map<dynamic, dynamic> json) {
    institute = json["institute"];
    owner = json["owner"];
    ownernum = json["ownernum"];
    contentCollection = json["contentCollection"];
    province = json["province"];
  }
}
