import 'package:flutter/material.dart';
import 'package:jobtask/pages/Step1.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        cursorColor: Colors.orange,
      ),
      home: Step1(),
    );
  }
}