import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:report/login.dart';
import 'spalshScreen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  SplashScreen splashScreen = new SplashScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '123',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
        home: splashScreen,
      );
  }
}


