import 'package:flutter/material.dart';
import 'new_comment.dart';
import 'problem.dart';

// ignore: must_be_immutable
class newTabs extends StatelessWidget {
  String imagePath;

  newTabs(String img) {
    this.imagePath = img;
  }
  @override
  Widget build(BuildContext context) {
    newCommentPage comment = new newCommentPage(imagePath,1);
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