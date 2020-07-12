import 'package:flutter/material.dart';
import 'package:report/choose.dart';
import 'package:report/drawer.dart';
import 'package:report/homepage.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Bar(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _Bar extends StatelessWidget {
  String username = '李亞璇';
  Tabs tabs = new Tabs();
  Toptitle toptitle = new Toptitle();
  NavDrawerExample navDrawerExample = new NavDrawerExample();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toptitle.Topbar(context,'膚況檢測'),
      body: tabs,
      drawer: navDrawerExample.drawer(context),
    );
  }
}

class Toptitle {
  PreferredSize Topbar(BuildContext context, String titlename) {
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
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
        preferredSize: Size.fromHeight(60));
  }
}
