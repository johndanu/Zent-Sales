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
  String? remarks;

  String? province;
  String? district;
  String? status;




  StudentData(
      {this.institute,
      this.owner,
      this.ownernum,
      this.contentCollection,
      this.remarks,

      this.province,
      this.district,
      this.status,



      });

  StudentData.fromJson(Map<dynamic, dynamic> json) {
    institute = json["institute"];
    owner = json["owner"];
    ownernum = json["ownernum"];
    contentCollection = json["contentCollection"];
    remarks = json["remarks"];

    province = json["province"];
    district = json["district"];
    status = json["status"];



  }
}
