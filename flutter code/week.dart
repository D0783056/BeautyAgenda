import 'package:flutter/material.dart';
import 'choose.dart';
import 'week_menu.dart';
import 'bar.dart';

class Week extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MyStatelessWidget();
  }
}

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  Tabs tabs = new Tabs("dd",1,1,1);
  Toptitle weektitle = Toptitle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: weektitle.Topbar('每週養顏'),
      body: WeekmenuPage(),
    );
  }
}