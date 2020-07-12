import 'package:flutter/material.dart';
import 'package:report/comment.dart';
import 'package:report/problem.dart';

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => TabsState();
}
class TabsState extends State<Tabs> {
  @override

  Widget build(BuildContext context) {
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
              CommentPage(),ProblemPage(),
            ],
          )
      ),
    );
  }
}