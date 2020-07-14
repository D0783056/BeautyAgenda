import 'package:flutter/material.dart';
import 'package:report/drawer.dart';
import 'package:report/skin_change.dart';
import 'package:report/week_menu.dart';
import 'package:report/bar.dart';

class Skin extends StatelessWidget {

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
  static String username = '李亞璇';
  NavDrawerExample navDrawerExample = new NavDrawerExample(username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: weektitle.Topbar(context,'膚況變化',username),
      body: Skin_change(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}