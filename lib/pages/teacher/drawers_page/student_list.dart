import 'package:flutter/material.dart';
import 'package:pickteacher/widgets/app_drawer.dart';
class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List"), actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        // PopupMenuButton<String>(
        //   onSelected: choiseAction,
        //   itemBuilder: (context) {
        //     return Constants.choices.map((String choices) {
        //       return PopupMenuItem<String>(
        //         value: choices,
        //         child: Text(choices),
        //       );
        //     }).toList();
        //   },
        // ),
      ]),
      // drawer: AppDrawer(),
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
  onTap: (){
      // Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context)=>StudentList(),
      //           ));
  },
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  // leading: Container(
  //   padding: EdgeInsets.only(right: 12.0),
  //   decoration: new BoxDecoration(
  //       border: new Border(
  //           right: new BorderSide(width: 1.0, color: Colors.blueGrey))),
  //   child: Icon(Icons.autorenew, color: Colors.blueGrey),
  // ),
  leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage("https://via.placeholder.com/150"),
                backgroundColor: Colors.transparent,
              ),
  title: Text(
    "Student names",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  subtitle:   Row(
        children: <Widget>[
         // Icon(Icons.linear_scale, color: Colors.purple),
          Text("Class 10",
              style: TextStyle(color: Colors.blueGrey),
              ),
        ],
      ),
      
  trailing:Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey, size: 30.0),
);
