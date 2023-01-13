import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_realtime_database_crud_tutorial/models/student_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtAgeController = TextEditingController();
  final TextEditingController _edtSubjectController = TextEditingController();
  final TextEditingController _edtInstituteController = TextEditingController();
  final TextEditingController _edtOwnersController = TextEditingController();
  final TextEditingController _edtOwnersPhoneController =
      TextEditingController();
  final TextEditingController _edtContentcollectionDetailController =
      TextEditingController();

  List<Student> studentList = [];

  bool updateStudent = false;

  @override
  void initState() {
    super.initState();

    retrieveStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Directory"),
        backgroundColor: Color(0xff2B9A9F),
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
        backgroundColor: Color(0xff2B9A9F),
        onPressed: () {
          _edtNameController.text = "";
          _edtAgeController.text = "";
          _edtSubjectController.text = "";
          _edtInstituteController.text = "";
          _edtOwnersController.text = "";
          _edtOwnersPhoneController.text = "";
          _edtContentcollectionDetailController.text = "";

          updateStudent = false;
          studentDialog();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void studentDialog({String? key}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TextField(
                  //   controller: _edtNameController,
                  //   decoration: const InputDecoration(helperText: "Name"),
                  // ),
                  // TextField(
                  //     controller: _edtAgeController,
                  //     decoration: const InputDecoration(helperText: "Age")),
                  // TextField(
                  //     controller: _edtSubjectController,
                  //     decoration: const InputDecoration(helperText: "Subject")),

                  const Text(
                    "Institute Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff2B9A9F), // Background color
                        ),
                        onPressed: () {
                          Map<String, dynamic> data = {
                            "name": _edtNameController.text.toString(),
                            "age": _edtAgeController.text.toString(),
                            "subject": _edtSubjectController.text.toString(),
                            "institute":
                                _edtInstituteController.text.toString(),
                            "owner": _edtOwnersController.text.toString(),
                            "ownernum":
                                _edtOwnersPhoneController.text.toString(),
                            "contentCollection":
                                _edtContentcollectionDetailController.text
                                    .toString(),
                          };

                          if (updateStudent) {
                            dbRef
                                .child("Students")
                                .child(key!)
                                .update(data)
                                .then((value) {
                              int index = studentList
                                  .indexWhere((element) => element.key == key);
                              studentList.removeAt(index);
                              studentList.insert(
                                  index,
                                  Student(
                                      key: key,
                                      studentData: StudentData.fromJson(data)));
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
                        child:
                            Text(updateStudent ? "Update Data" : "Save Data")),
                  )
                ],
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
        // _edtNameController.text = student.studentData!.name!;
        // _edtAgeController.text = student.studentData!.age!;
        // _edtSubjectController.text = student.studentData!.subject!;
        _edtInstituteController.text = student.studentData!.institute!;
        _edtOwnersController.text = student.studentData!.owner!;
        _edtOwnersPhoneController.text = student.studentData!.ownernum!;
        _edtContentcollectionDetailController.text =
            student.studentData!.contentCollection!;

        updateStudent = true;
        studentDialog(key: student.key);
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
                // Text(student.studentData!.name!),
                // Text(student.studentData!.age!),
                // Text(student.studentData!.subject!),
              ],
            ),
            InkWell(
                onTap: () {
                  dbRef
                      .child("Students")
                      .child(student.key!)
                      .remove()
                      .then((value) {
                    int index = studentList
                        .indexWhere((element) => element.key == student.key!);
                    studentList.removeAt(index);
                    setState(() {});
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
