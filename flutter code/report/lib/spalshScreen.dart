import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0,100,0,50),
          child: Column(
            children: <Widget>[
              Container(
                  child: Center(child: Image.asset('images/in.jpg'),)
              )
            ],
          ),
        ),
      ),
    );
  }
}