// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.InstituteName,
    required this.OwnerName,
    required this.OwnerNumber,
    required this.ContentCollection,
    required this.Remarks,

    required this.Province,
    required this.District,
    required this.Status,



  });

  final String InstituteName;
  final String OwnerName;
  final String OwnerNumber;
  final String ContentCollection;
  final String Remarks;

  final String Province;
  final String District;
  final String Status;



  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details Page"),
          backgroundColor: const Color(0xff2B9A9F),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Title(
                    color: Colors.blue,
                    child: const Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 24, decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Institute Name :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.InstituteName,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Owner's Name :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.OwnerName,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Owner's Number :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.OwnerNumber,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "ContentCollection :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.ContentCollection,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                   Row(
                    children: [
                      const Text(
                        "Remarks :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.Remarks,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Province :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.Province,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      const Text(
                        "district :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.District,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                   Row(
                    children: [
                      const Text(
                        "status :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.Status,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ));
  }
}
