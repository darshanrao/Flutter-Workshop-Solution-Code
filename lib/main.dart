import 'package:flutter/material.dart';
import 'package:resume1/Screens/resume_list.dart';
import 'Screens/flutter_form.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InputForm());
  }
}
