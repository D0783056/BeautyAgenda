import 'package:flutter/material.dart';
import 'choose.dart';
import 'drawer.dart';
import 'homepage.dart';

// ignore: must_be_immutable
class Bar extends StatelessWidget {
  int id;
  String imagePath;
  int isFront;
  var test;

  Bar(int id, String imagePath, int isFront, var test){
    this.id = id;
    this.imagePath = imagePath;
    this.isFront = isFront;
    this.test = test;
  }

  @override
  Widget build(BuildContext context) {
    Tabs tabs = new Tabs(imagePath, id, isFront,test);
    Toptitle toptitle = new Toptitle();
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);
    return Scaffold(
      appBar:toptitle.Topbar(context,'膚況報告',id),
      body: tabs,
    );
  }
}

class Toptitle {
  // ignore: non_constant_identifier_names
  PreferredSize Topbar(BuildContext context, String titlename,int id) {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFFFFD0D1),
          title: Center(
            child: Text(
              '$titlename',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'GFSDidot',
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(60));
  }
}