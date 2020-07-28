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
    NavDrawerExample navDrawerExample = new NavDrawerExample();
    return Scaffold(
      appBar:toptitle.Topbar(context,'膚況報告',id),
      body: tabs,
      drawer: navDrawerExample.drawer(context),
    );
  }
}

class Toptitle {
  PreferredSize Topbar(BuildContext context, String titlename,int id) {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFFFFD0D1),
          leading: NavDrawerExample(),
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              iconSize: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(id)),
                );
              },
            ),
          ],
        ),
        preferredSize: Size.fromHeight(60));
  }
}