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

  List<Student> studentList = [];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0 ; i < studentList.length ; i++)
              studentWidget(studentList[i])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        studentDialog();
      },child: const Icon(Icons.save),),
    );
  }

  void studentDialog() {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _edtNameController, decoration: const InputDecoration(helperText: "Name"),),
              TextField(controller: _edtAgeController, decoration: const InputDecoration(helperText: "Age")),
              TextField(controller: _edtSubjectController, decoration: const InputDecoration(helperText: "Subject")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                
                Map<String,dynamic> data = {
                  "name": _edtNameController.text.toString(),
                  "age": _edtAgeController.text.toString(),
                  "subject": _edtSubjectController.text.toString()
                };
                
                dbRef.child("Students").push().set(data).then((value){
                  Navigator.of(context).pop();
                });
                
              }, child: const Text("Save Data"))
            ],
          ),
        ),
      );
    });
  }

  void retrieveStudentData() {
    dbRef.child("Students").onChildAdded.listen((data) {
      StudentData studentData = StudentData.fromJson(data.snapshot.value as Map);
      Student student = Student(key: data.snapshot.key, studentData: studentData);
      studentList.add(student);
      setState(() {});
    });
  }

  Widget studentWidget(Student studentList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top:5,left: 10,right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(studentList.studentData!.name!),
              Text(studentList.studentData!.age!),
              Text(studentList.studentData!.subject!),
            ],
          ),

          const Icon(Icons.delete,color: Colors.red,)
        ],
      ),
    );
  }
}
