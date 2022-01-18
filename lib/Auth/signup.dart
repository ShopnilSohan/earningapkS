
import 'dart:io';

import 'package:earningapk/Auth/loginpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUps extends StatefulWidget {
  const SignUps({Key? key}) : super(key: key);

  @override
  _SignUpsState createState() => _SignUpsState();
}

class _SignUpsState extends State<SignUps> {

  bool hiddenpassword = true;
  bool _checkbox = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController referController = TextEditingController();

  String? name = stdin.readLineSync();
  String? Phone = stdin.readLineSync();
  String? pass = stdin.readLineSync();

  @override


  Widget build(BuildContext context) {

    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.green,
              Colors.red,
              Colors.deepOrange,
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Signup",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Colors.black54,
                                      ),
                                      hintText: "Enter Full Name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mobile_friendly_sharp,
                                        color: Colors.black54,
                                      ),
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: referController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.add_moderator,
                                        color: Colors.black54,
                                      ),
                                      hintText: "Refer Code(optional 1234)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: passController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            hiddenpassword = !hiddenpassword;
                                          });
                                        },
                                        icon: Icon(
                                          hiddenpassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black54,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey,),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                            Colors.green,
                            Colors.red,
                            Colors.deepOrange,
                          ]) ,
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[900]),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onSurface:Colors.black ,
                                onPrimary: Colors.red,
                                primary: (Colors.green),
                                fixedSize: Size(320, 65),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              if (nameController.text.isEmpty ||
                                  phoneController.text.isEmpty ||
                                  referController.text.isEmpty ||
                                  passController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  backgroundColor: Colors.green,
                                    msg:
                                    'please enter your name, phone,password and refer code',textColor: Colors.white,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Signup Successful',
                                    textColor: Colors.white,
                                    backgroundColor: Colors.green,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR);
                                setSharedPref();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 29, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: sohan1 / 1,
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '''Already have an account? ''',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()));
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  setSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('name', nameController.text);
    pref.setString('pame', phoneController.text);
    pref.setString('refer', referController.text);
    pref.setString('pass', passController.text);
  }
}
