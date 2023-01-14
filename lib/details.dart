import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.InstituteName,
    required this.OwnerName,
    required this.OwnerNumber,
    required this.ContentCollection,
  });

  final String InstituteName;
  final String OwnerName;
  final String OwnerNumber;
  final String ContentCollection;

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
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Institute Name :- ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.InstituteName ?? "AATHAVAN  name not registeered",
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
                )
              ],
            ),
          ),
        ));
  }
}
