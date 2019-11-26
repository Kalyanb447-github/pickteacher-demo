import 'package:flutter/material.dart';
import 'package:pickteacher/pages/test_profile_page/test_profile_page.dart';
class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   child: Center(
      //     child: Text('profile', textScaleFactor: 5.0),
      //   ),
      // ),
      body: TestProfilePage(),
    );
  }
}

