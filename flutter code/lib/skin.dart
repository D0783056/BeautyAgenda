import 'package:flutter/material.dart';
import 'package:report/drawer.dart';
import 'package:report/skin_change.dart';
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

  String username;
  NavDrawerExample navDrawerExample = new NavDrawerExample();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Toptitle().Topbar(context,'膚況變化',username),
        body: Skin_change(),
        drawer: navDrawerExample.drawer(context),
      ),
    );
  }
}