import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:pickteacher/pages/login/phone_login.dart';
import 'package:pickteacher/pages/signIn.dart';
import 'package:pickteacher/pages/signUp.dart';
import 'package:pickteacher/pages/student/student_profile.dart';
import 'package:pickteacher/pages/testPhoneAuth/one.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/splash_screen.dart';
import 'pages/student/student_dashboard.dart';
import 'pages/student/student_home.dart';
import 'pages/teacher/teacher_dashboard.dart';
import 'pages/testFancyNavigationBar/fancy_navigation_bar.dart';
import 'pages/testFlutterStepper/flutter_stepper.dart';
import 'pages/testSearch/test_search_page.dart';
import 'pages/testUserInterface/appbar_many.dart';
import 'pages/who_are_you.dart';

import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //login checking
  bool _isLoggedIn = true;
  @override
  void initState() {
    //_checkedIfLoggedIn();
    super.initState();
    _checkIntroPageSeen();
  }

  // _checkedIfLoggedIn() async {
  //   //check if there is token
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   if (token != null) {
  //     setState(() {
  //       _isLoggedIn = true;
  //     });
  //   }
  //   print(token);
  // }
    //making list of pages needed to pass in IntroViewsFlutter constructor.


     bool checkIntroPageSeen=false;
    _checkIntroPageSeen()async{
          SharedPreferences localStorage = await SharedPreferences.getInstance();
          if (localStorage.getBool('checkIntroPageSeen')==null) {
            checkIntroPageSeen=false;
          }
          if (checkIntroPageSeen) {
          goIntoApp();
          }
          
    }
  final pages = [
    //student 
    PageViewModel(
     // bubbleBackgroundColor: Colors.greenAccent,

        //  pageColor: const Color(0xFF03A9F4),
                pageColor: Colors.purple[200],

         iconImageAssetPath: 'assets/air-hostess.png',
       // bubble: Image.asset('assets/air-hostess.png'),
        body: Text(
          'Student  can find any teacher according to his requirement',
        ),
        title: Text(
          'Student',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white,fontSize: 40),
        mainImage: Image.asset(
          'assets/student.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        ),

        //to do
         PageViewModel(
     // bubbleBackgroundColor: Colors.greenAccent,

        //  pageColor: const Color(0xFF03A9F4),
                pageColor: Colors.white,

         iconImageAssetPath: 'assets/air-hostess.png',
       // bubble: Image.asset('assets/air-hostess.png'),
        body: Text(
          'Student  And Teacher can create a todo list for a week',
        ),
        title: Text(
          'To Do List',
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.blueGrey),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.blueGrey,fontSize: 40),
        mainImage: Image.asset(
          'assets/todo.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        ),

    PageViewModel(
           // bubbleBackgroundColor: Colors.greenAccent,

      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      body: Text(
        'Teacher register and get many student also utilise your time with money',
      ),
      title: Text('Teacher'),
      mainImage: Image.asset(
        'assets/teacher.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white,fontSize: 30),
    ),
    PageViewModel(
            bubbleBackgroundColor: Colors.greenAccent,

      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(
        'We help to explore the knowledge with the world',
      ),
      title: Text('Knowledge'),
      mainImage: Image.asset(
        'assets/both.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white,fontSize: 40),
    ),
  ];


goIntoApp(){
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WhoAreYou(),
              ), //MaterialPageRoute
            );
}

skipIntroPage()async{
           SharedPreferences localStorage = await SharedPreferences.getInstance();
           localStorage.setBool('checkIntroPageSeen',true);
           print('checkIntroPageSeen is now true');
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF734C99)
      ),
     // home: _isLoggedIn ? WhoAreYou() : SignInPage(),
       home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,  
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton:(){
              Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => WhoAreYou(),
                                builder: (context) => StudentDashboard(),

              ), //MaterialPageRoute
            );
          },
          onTapSkipButton:(){
              Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => TestSearchpage(),
                builder: (context) => TeacherDashboard(),

                
              ), //MaterialPageRoute
            );

             skipIntroPage();
            
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Bu
    );
  }
}
