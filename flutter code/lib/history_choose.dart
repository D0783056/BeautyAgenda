import 'package:flutter/material.dart';
import 'bar.dart';
import 'history_comment.dart';
import 'history_problem.dart';


class History_tabs extends StatefulWidget {
  History_tabs(this.id);
  int id;
  @override
  History_tabsState createState() => History_tabsState(id);
}
class History_tabsState extends State<History_tabs> {
  Toptitle toptitle = new Toptitle();
  History_tabsState(this.id);
  int id;
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
          appBar:
          PreferredSize(
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
              HistoryComment(id),History_problem(id),
            ],
          )
      ),
    );
  }
}
