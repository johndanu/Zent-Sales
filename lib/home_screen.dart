import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_realtime_database_crud_tutorial/details.dart';
import 'package:firebase_realtime_database_crud_tutorial/models/student_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtInstituteController = TextEditingController();
  final TextEditingController _edtOwnersController = TextEditingController();
  final TextEditingController _edtOwnersPhoneController =
      TextEditingController();
  final TextEditingController _edtContentcollectionDetailController =
      TextEditingController();
       final TextEditingController _edtRemarksController =
      TextEditingController();

  List<Student> studentList = [];

  bool updateStudent = false;

  @override
  void initState() {
    super.initState();

    retrieveStudentData();
  }

  final List<String> province = [
    'Nothern',
  ];
  String? selectedProvince;

  final List<String> district = [
    'Jaffna',
    'Kilinochchi',
    'Vavuniya',
    'Mannar',
  ];
  String? selectedDistrict;
  final List<String> status = [
    'wanna Contact',
    'Contacted',
    'Meeting Scheduled',
    'Proposal Delivered',
    'Wanna Contact Again',
    'Lost',
    'Won',
    'Form sent',
    'Data collected',
    'Listed in the website',
    'Pending'
  ];
  String? selectedstatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Directory"),
        backgroundColor: const Color(0xff2B9A9F),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < studentList.length; i++)
                studentWidget(studentList[i])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff2B9A9F),
        onPressed: () {
          _edtInstituteController.text = "";
          _edtOwnersController.text = "";
          _edtOwnersPhoneController.text = "";
          _edtContentcollectionDetailController.text = "";
           _edtRemarksController.text = "";
          selectedProvince = selectedProvince;
          selectedDistrict = selectedDistrict;
          selectedstatus = selectedstatus;


          updateStudent = false;
          studentDialog();
        },
        child: const Icon(
          Icons.create,
        ),
      ),
    );
  }

  void studentDialog({String? key}) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Dialog(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Institute Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _edtInstituteController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Owner's Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _edtOwnersController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Owner's Number",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _edtOwnersPhoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Content Collection Detail",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _edtContentcollectionDetailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     const Text(
                      "Remarks",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _edtRemarksController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Province',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      items: province
                          .map((item1) => DropdownMenuItem<String>(
                                value: item1,
                                child: Text(
                                  item1,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedProvince,
                      onChanged: (province) {
                        setState(() {
                          selectedProvince = province as String;
                        });
                      },
                      iconSize: 14,
                      buttonHeight: 30,
                      buttonWidth: 300,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                'district',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      items: district
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedDistrict,
                      onChanged: (district) {
                        setState(() {
                          selectedDistrict = district as String;
                        });
                      },
                      iconSize: 14,
                      buttonHeight: 30,
                      buttonWidth: 300,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                      DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                'status',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      items: status
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedstatus,
                      onChanged: (status) {
                        setState(() {
                          selectedstatus = status as String;
                        });
                      },
                      iconSize: 14,
                      buttonHeight: 30,
                      buttonWidth: 300,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xff2B9A9F), // Background color
                          ),
                          onPressed: () {
                            Map<String, dynamic> data = {
                              "institute":
                                  _edtInstituteController.text.toString(),
                              "owner": _edtOwnersController.text.toString(),
                              "ownernum":
                                  _edtOwnersPhoneController.text.toString(),
                              "contentCollection":
                                  _edtContentcollectionDetailController.text
                                      .toString(),
                                      "remarks":
                                  _edtRemarksController.text
                                      .toString(),
                              "province": selectedProvince.toString(),
                              "district": selectedDistrict.toString(),
                              "status": selectedstatus.toString(),

                            };

                            if (updateStudent) {
                              dbRef
                                  .child("Students")
                                  .child(key!)
                                  .update(data)
                                  .then((value) {
                                int index = studentList.indexWhere(
                                    (element) => element.key == key);
                                studentList.removeAt(index);
                                studentList.insert(
                                    index,
                                    Student(
                                        key: key,
                                        studentData:
                                            StudentData.fromJson(data)));
                                setState(() {});
                                Navigator.of(context).pop();
                              });
                            } else {
                              dbRef
                                  .child("Students")
                                  .push()
                                  .set(data)
                                  .then((value) {
                                Navigator.of(context).pop();
                              });
                            }
                          },
                          child: Text(
                              updateStudent ? "Update Data" : "Save Data")),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void retrieveStudentData() {
    dbRef.child("Students").onChildAdded.listen((data) {
      StudentData studentData =
          StudentData.fromJson(data.snapshot.value as Map);
      Student student =
          Student(key: data.snapshot.key, studentData: studentData);
      studentList.add(student);
      setState(() {});
    });
  }

  Widget studentWidget(Student student) {
    return InkWell(
      onTap: () {
        // print(student.studentData!.district);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              InstituteName: student.studentData!.institute!,
              OwnerName: student.studentData!.owner!,
              OwnerNumber: student.studentData!.ownernum!,
              ContentCollection: student.studentData!.contentCollection!,
              Remarks: student.studentData!.remarks!,

              Province: student.studentData!.province!,
              District: student.studentData!.district!,
              Status: student.studentData!.status!,

            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.studentData!.institute!),
                Text(student.studentData!.province!),
                Text(student.studentData!.contentCollection!),
                Text(student.studentData!.ownernum!),
              ],
            ),
            Positioned.fill(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _edtInstituteController.text =
                          student.studentData!.institute!;
                      _edtOwnersController.text = student.studentData!.owner!;
                      _edtOwnersPhoneController.text =
                          student.studentData!.ownernum!;
                      _edtContentcollectionDetailController.text =
                          student.studentData!.contentCollection!;
                           _edtRemarksController.text =
                          student.studentData!.remarks!;
                      selectedProvince = student.studentData!.province!;
                      selectedDistrict = student.studentData!.district!;
                      selectedstatus = student.studentData!.status!;


                      updateStudent = true;
                      studentDialog(key: student.key);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 4, 2, 2),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      dbRef
                          .child("Students")
                          .child(student.key!)
                          .remove()
                          .then((value) {
                        int index = studentList.indexWhere(
                            (element) => element.key == student.key!);
                        studentList.removeAt(index);
                        setState(() {});
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
