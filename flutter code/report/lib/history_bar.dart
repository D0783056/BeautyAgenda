import 'package:flutter/material.dart';
import 'package:report/choose.dart';
import 'package:report/drawer.dart';
import 'package:report/history_choose.dart';
import 'package:report/bar.dart';

class History_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _History_bar(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _History_bar extends StatelessWidget {
  static String username = '李亞璇';
  History_tabs history_tabs = new History_tabs();
  Toptitle toptitle = new Toptitle();
  NavDrawerExample navDrawerExample = new NavDrawerExample(username);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toptitle.Topbar(context,'檢測歷史',username),
      body: history_tabs,
      drawer: navDrawerExample.drawer(context),
    );
  }
}
