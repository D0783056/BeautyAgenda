import 'package:flutter/material.dart';
import 'comment.dart';
import 'problem.dart';

// ignore: must_be_immutable
class Tabs extends StatelessWidget {
  String imagePath;
  int id;
  int isFront;

  Tabs(String img, int id, int isFront) {
    this.imagePath = img;
    this.id = id;
    this.isFront = isFront;
  }

  @override
  Widget build(BuildContext context) {
    CommentPage comment = new CommentPage(imagePath, id, isFront);
    final _kTabs = <Tab>[
      Tab(text: '綜合'),
      Tab( text: '問題'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
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