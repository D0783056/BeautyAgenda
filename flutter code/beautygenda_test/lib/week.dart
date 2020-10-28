import 'package:flutter/material.dart';
import 'choose.dart';
import 'week_menu.dart';
import 'bar.dart';
import 'drawer.dart';

class Week extends StatelessWidget {
  int id;
  Week(int id){
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    print("id:");
    print(id);
    return  MyStatelessWidget(id);
  }
}

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable
class MyStatelessWidget extends StatelessWidget {
  int id;
  MyStatelessWidget(int id){
   this.id = id;
  }
  Tabs tabs = new Tabs("dd",1,1,1);
  Toptitle weektitle = Toptitle();

  @override
  Widget build(BuildContext context) {
    print("-----------");
    print(id);
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);
    return Scaffold(
      appBar: weektitle.Topbar(context,'每週養顏',id),
      body: WeekmenuPage(),
      drawer: navDrawerExample.drawer(context),
    );
  }
}