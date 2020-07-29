import 'package:flutter/material.dart';
import 'package:report/comment.dart';
import 'package:report/problem.dart';

class Tabs extends StatelessWidget {
  String imagePath;
  int id;

  Tabs(String img) {
    this.imagePath = img;
  }
  @override

  Widget build(BuildContext context) {
    CommentPage comment = new CommentPage(imagePath,id);
    final _kTabs = <Tab>[
      Tab(text: '綜合'),
      Tab( text: '問題'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
              tabs: _kTabs,
              labelColor: Colors.black,
              indicatorColor: Colors.grey,
              labelStyle: TextStyle(
                fontFamily: 'GFDSidot',
                fontSize: 30,
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              comment,ProblemPage(),
            ],
          )
      ),
    );
  }
}