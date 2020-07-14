import 'package:flutter/material.dart';
import 'package:report/day_menu.dart';
import 'package:report/bar.dart';
import 'package:report/drawer.dart';

class Day extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  static String username;
  Toptitle daytitle = new Toptitle();
  MyStatelessWidget({Key key}) : super(key: key);
  NavDrawerExample navDrawerExample = new NavDrawerExample(username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: daytitle.Topbar(context,'每日養顏',username),
      body: DaymenuPage(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}