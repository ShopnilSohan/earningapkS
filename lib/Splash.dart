import 'dart:async';
import 'package:earningapk/Auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashBoard.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var login_value = "0";
  void initState() {

    getlogin_value();
    Timer(
        Duration(seconds: 4),
            () => login_value == "1"
            ? Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHome()))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }

  @override
  getlogin_value() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      login_value = pref.getString("login")!;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/earning splash.png'),
      ),
    );
  }
}