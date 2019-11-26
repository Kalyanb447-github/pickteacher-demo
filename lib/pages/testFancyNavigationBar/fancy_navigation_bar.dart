import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:pickteacher/pages/teacher/teacher_home.dart';
import 'package:pickteacher/pages/teacher/teacher_notification.dart';
import 'package:pickteacher/pages/teacher/teacher_profile.dart';
import 'package:pickteacher/pages/teacher/teacher_search.dart';
import 'package:pickteacher/widgets/app_drawer.dart';

class FancyNavigationBar extends StatefulWidget {
  @override
  _FancyNavigationBarState createState() => _FancyNavigationBarState();
}

class _FancyNavigationBarState extends State<FancyNavigationBar> {
  int currentPage = 0;
  final tabs = [
    TabData(iconData: Icons.home, title: "Home"),
    TabData(iconData: Icons.search, title: "Search"),
    TabData(iconData: Icons.notifications, title: "notification"),
    TabData(iconData: Icons.person, title: "Profile")
  ];

  choiseAction(choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }

  List pages = [
    TeacherHome(),
    TeacherSearch(),
    TeacherNotification(),
    TeacherProfile()
  ];
  @override
  Widget build(BuildContext context) {
    String title = "Fancy Bottom Navigation Bar";
    return Scaffold(
      appBar: AppBar(title: Text("Appbar actions"), actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        PopupMenuButton<String>(
          onSelected: choiseAction,
          itemBuilder: (context) {
            return Constants.choices.map((String choices) {
              return PopupMenuItem<String>(
                value: choices,
                child: Text(choices),
              );
            }).toList();
          },
        ),
      ]),
      ///////
      bottomNavigationBar: FancyBottomNavigation(
        tabs: tabs,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: AppDrawer(),
      body: pages[currentPage],
    );
  }
}

class Constants {
  static const String Subscribe = 'Subscribe';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}







