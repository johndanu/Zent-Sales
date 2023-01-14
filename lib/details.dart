import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.InstituteName,
    required this.OwnerName,
    required this.OwnerNumber,
    required this.ContentCollection,
    required this.Province,
    // required this.District,
    // required this.Status,
  });

  final String InstituteName;
  final String OwnerName;
  final String OwnerNumber;
  final String ContentCollection;
  final String Province;
  // final String District;
  // final String Status;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
          backgroundColor: Color(0xff2B9A9F),
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
                    child: Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 24, decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Institute Name :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.InstituteName ??
                            "AATHAVAN  name not registeered",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Owner's Name :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.OwnerName ?? "AATHAVAN  name not registeered",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Owner's Number :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.OwnerNumber ?? "AATHAVAN  name not registeered",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "ContentCollection :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.ContentCollection ??
                            "AATHAVAN  name not registeered",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Province :- ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.Province ?? "AATHAVAN  name not registeered",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "District :- ",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //     Text(
                  //       widget.District ?? "AATHAVAN  name not registeered",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Status :- ",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //     Text(
                  //       widget.Status ?? "AATHAVAN  name not registeered",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
