import 'package:flutter/material.dart';
import 'package:report/homepage.dart';
import 'package:report/newchoose.dart';
import 'package:report/drawer.dart';
import 'package:report/bar.dart';
import 'choose.dart';

class newBar extends StatelessWidget {
  String username = '李亞璇';
  String imagePath;

  newBar(String img) {
    this.imagePath = img;
  }

  @override
  Widget build(BuildContext context) {
    newTabs tabs = new newTabs(imagePath);
    NavDrawerExample navDrawerExample = new NavDrawerExample(username);
    Toptitle toptitle = new Toptitle();
    return Scaffold(
      appBar:toptitle.Topbar(context,'膚況報告',username),
      body: tabs,
      drawer: navDrawerExample.drawer(context),
    );
  }
}