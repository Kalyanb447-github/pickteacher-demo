import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: makeBody,
    );
  }
}

final Widget makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);

final Widget makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
        // color: Color.fromRGBO(64, 75, 96, .9)
        color: Colors.white),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration(
        border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.blueGrey))),
    child: Icon(Icons.autorenew, color: Colors.blueGrey),
  ),
  title: Text(
    "Teacher Name",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  subtitle:   Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.purple),
          Text(" English Math Physics",
              style: TextStyle(color: Colors.blueGrey))
        ],
      ),
      
  trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey, size: 30.0),
);
