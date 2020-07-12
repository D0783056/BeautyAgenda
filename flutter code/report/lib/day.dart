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
  Toptitle daytitle = new Toptitle();
  MyStatelessWidget({Key key}) : super(key: key);
  NavDrawerExample navDrawerExample = new NavDrawerExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: daytitle.Topbar(context,'每日養顏'),
      body: DaymenuPage(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}