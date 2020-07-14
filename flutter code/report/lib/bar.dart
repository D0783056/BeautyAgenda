import 'package:flutter/material.dart';
import 'package:report/choose.dart';
import 'package:report/drawer.dart';
import 'package:report/homepage.dart';

/// This is the stateless widget that the main application instantiates.
class Bar extends StatelessWidget {

  static String username = '李亞璇';
  String imagePath;

  Bar(String img) {
    this.imagePath = img;
  }
  Tabs tabs = new Tabs();
  Toptitle toptitle = new Toptitle();
  NavDrawerExample navDrawerExample = new NavDrawerExample(username);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toptitle.Topbar(context,'膚況檢測' , username),
      body: tabs,
      drawer: navDrawerExample.drawer(context),
    );
  }
}

class Toptitle {
  int id;
  PreferredSize Topbar(BuildContext context, String titlename , String username) {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFFFFD0D1),
          leading: NavDrawerExample(username),
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
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
        preferredSize: Size.fromHeight(60));
  }
}
