import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:report/bar.dart';
import 'package:report/homepage.dart';
import 'package:report/spalshScreen.dart';
void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {


  SplashScreen splashScreen = new SplashScreen();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
        home: splashScreen,
    );
  }
}


