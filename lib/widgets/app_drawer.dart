import 'package:flutter/material.dart';
import 'package:pickteacher/pages/teacher/drawers_page/student_list.dart';

// import '../screens/orders_screen.dart';
// import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Kalyan Biswas'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timing'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text('Routine'),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context)=>ContactList(),
                // ));
                   
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Students List'),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
                   Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>StudentList(),
                ));
              },
            ),
                 Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Fees'),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
