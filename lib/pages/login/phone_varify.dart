import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickteacher/pages/signIn.dart';
import 'package:pickteacher/pages/signUp.dart';
import 'package:pickteacher/widgets/custom_shape.dart';
import 'package:pickteacher/widgets/responsive_ui.dart';
class PhoneVarify extends StatefulWidget {
  @override
  _PhoneVarifyState createState() => _PhoneVarifyState();
}

class _PhoneVarifyState extends State<PhoneVarify> {
double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  // signInWithEmailPassword() async {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //   FirebaseUser currentUser;
  //   await _auth
  //       .signInWithEmailAndPassword(
  //           email: emailController.text, password: passwordController.text)
  //       .catchError((error) {
  //     print('Error is : $error');
  //   }).then((onValue) {
  //     currentUser = onValue.user;
  //     print('$currentUser  logged in');
  //     print(' user name is ${currentUser.email}');
  //   });
  // }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }


  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (contect)=>SignInPage(),
        ));      
        }
    });
  }

  navigateToSignupScreen() {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (contect)=>SignInPage(),
        ));    }

  @override
  void initState() {
    super.initState();
   // this.checkAuthentication();
  }

  void signin() async {
    // if (_formKey.currentState.validate()) {
    //   _formKey.currentState.save();

   
    
       try {
        AuthResult user = await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (contect)=>HomePage(user:user),
        // ));  
      } catch (e) {
        showError(e.message);
      }
    
  }

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              signInTextRow(),
              form(),
            
              SizedBox(height: _height / 12),
              button(),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // colors: [Colors.orange[200], Colors.pinkAccent],
                   colors: [Colors.white, Color(0xFF734C99)],

                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // colors: [Colors.orange[200], Colors.pinkAccent],
                    colors: [Colors.white, Color(0xFF734C99)],


                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          // child: Image.asset(
          //   'assets/images/login.png',
          //   height: _height/3.5,
          //   width: _width/3.5,
          // ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Sign in to your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
           
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          // // isEmail(value)==true;
          // if (!isEmail(value)) {
          //   return 'this is not an email';
          // }
          return null;
        },
        onSaved: (value) => emailController.text = value,
        controller: emailController,
        keyboardType: TextInputType.number,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone_android, color:Theme.of(context).primaryColor, size: 20),
          hintText: "OTP",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

 

 

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

      onPressed:  () async {

         if (_formKey.currentState.validate()) {
           _formKey.currentState.save();
           // If the form is valid, display a Snackbar.
           print('all data validate');
           signin();
         }
       },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 2 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            // colors: <Color>[Colors.orange[200], Colors.pinkAccent],
              colors: [Color(0xFF734C99),Colors.purple[100]],
 
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('varify',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 16 : 10))),
      ),
    );
  }


}
