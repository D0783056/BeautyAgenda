import 'package:flutter/material.dart';
import 'package:report/bar.dart';
import 'package:report/history_comment.dart';
import 'package:report/history_problem.dart';


class History_tabs extends StatefulWidget {
  @override
  History_tabsState createState() => History_tabsState();
}
class History_tabsState extends State<History_tabs> {
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
              HistoryComment(),History_problem(),
            ],
          )
      ),
    );
  }
}