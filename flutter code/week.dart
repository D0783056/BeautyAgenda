import 'package:flutter/material.dart';
import 'choose.dart';
import 'week_menu.dart';
import 'bar.dart';
import 'drawer.dart';

class Week extends StatelessWidget {
  int id;
  Week(this.id);
  @override
  Widget build(BuildContext context) {
    return  MyStatelessWidget(id);
  }
}

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable
class MyStatelessWidget extends StatelessWidget {
  int id;
  MyStatelessWidget(this.id);
  Tabs tabs = new Tabs("dd",1,1,1);
  Toptitle weektitle = Toptitle();

  @override
  Widget build(BuildContext context) {
    NavDrawerExample navDrawerExample = new NavDrawerExample();
    return Scaffold(
      appBar: weektitle.Topbar(context,'每週養顏',id),
      body: WeekmenuPage(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}