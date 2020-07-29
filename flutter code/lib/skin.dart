import 'package:flutter/material.dart';
import 'drawer.dart';
import 'skin_change.dart';
import 'bar.dart';

class Skin extends StatelessWidget {
  int id;
  Skin(this.id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatelessWidget(id),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  int id;
  MyStatelessWidget(this.id);
  String username;
  @override
  Widget build(BuildContext context) {
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);
    return SafeArea(
      child: Scaffold(
        appBar: Toptitle().Topbar(context,'膚況變化',id),
        body: Skin_change(id),
        drawer: navDrawerExample.drawer(context),
      ),
    );
  }
}