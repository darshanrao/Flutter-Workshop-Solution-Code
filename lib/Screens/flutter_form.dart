import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume1/Screens/resume_list.dart';
import 'package:resume1/Screens/resume_page.dart';
import 'package:resume1/main.dart';
import 'package:resume1/Screens/resume_page.dart';

import '../listtile.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  late String name;
  late String email;
  late String desc;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Card(
                color: Color(0xFF424242),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Resume Builder",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter Your Name",
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });

                            print(name);
                          },
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter Your Email",
                          hintStyle:
                              TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: "Enter Your Description",
                          hintStyle:
                              TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        onChanged: (value) {
                          desc = value;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                            onPressed: () {
                              _firestore.collection('resume').add({
                                'name': name,
                                'email': email,
                                'desc': desc,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResumeList()));
                            },
                            child: const Text("Submit")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
