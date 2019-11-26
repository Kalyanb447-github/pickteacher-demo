import 'package:flutter/material.dart';
class TeacherSearch extends StatefulWidget {
  @override
  _TeacherSearchState createState() => _TeacherSearchState();
}

class _TeacherSearchState extends State<TeacherSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('search', textScaleFactor: 5.0),
        ),
      ),
    );
  }
}