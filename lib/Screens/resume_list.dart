import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume1/Screens/resume_page.dart';
import 'package:resume1/listtile.dart';

import '../listtile.dart';

final _fireStore = FirebaseFirestore.instance;

class ResumeList extends StatefulWidget {
  const ResumeList({Key? key}) : super(key: key);

  @override
  _ResumeListState createState() => _ResumeListState();
}

class _ResumeListState extends State<ResumeList> {
  List<ListWidget> resumeList = [
    const ListWidget(
        name: 'Tejas Shelke',
        email: 'tejas@gmail.com',
        year: 'Third Year, Computer Engineering'),
    const ListWidget(
        name: 'Darshan Rao',
        email: 'darshan@gmail.com',
        year: 'Third Year, Computer Engineering')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume List"),
        backgroundColor: Colors.green,
      ),
      body: ResumeStream(),
    );
  }
}

class ResumeStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('resume').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final resumes = snapshot.data!.docs;
        print(resumes);
        List<GestureDetector> resumeListWidgets = [];
        for (var resume in resumes) {
          final name = resume['name'].toString();
          final email = resume['email'].toString();
          final desc = resume['desc'].toString();
          final resumeListWidget = GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResumePage(
                            email: email,
                            name: name,
                            desc: desc,
                          )));
            },
            child: ListWidget(
              name: name,
              email: email,
              year: desc,
            ),
          );
          resumeListWidgets.add(resumeListWidget);
        }
        return ListView(
          children: resumeListWidgets,
        );
      },
    );
    ;
  }
}
