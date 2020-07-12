import 'package:flutter/material.dart';
import 'package:report/drawer.dart';
import 'package:report/week_menu.dart';
import 'package:report/bar.dart';

class Week extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  Toptitle weektitle = Toptitle();
  Bar bar = new Bar();
  NavDrawerExample navDrawerExample = new NavDrawerExample();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: weektitle.Topbar(context,'每週養顏'),
      body: WeekmenuPage(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}