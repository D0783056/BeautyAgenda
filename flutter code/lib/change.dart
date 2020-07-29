import 'package:flutter/material.dart';
import 'package:report/choose.dart';
import 'package:report/drawer.dart';
import 'package:report/history_bar.dart';
import 'package:report/history_choose.dart';
import 'package:report/bar.dart';


class History_day extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _History_day(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _History_day extends StatelessWidget {
  String username = '李亞璇';
  History_tabs history_tabs = new History_tabs();
  Toptitle toptitle = new Toptitle();
  NavDrawerExample navDrawerExample = new NavDrawerExample();
  static var nowday = DateTime.now();
  var year = nowday.year;
  var month = nowday.month;
  var day = nowday.day;

  Widget date(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => History_bar()),
            );
          },
          child: Text(
            '$year / $month / $day',
            style: TextStyle(
              fontSize: 30,
              color: Color(0XFF818181),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toptitle.Topbar(context,'檢測歷史',username),
      body: Column(
        children: <Widget>[
          date(context),
        ],
      ),
      drawer: navDrawerExample.drawer(context),
    );
  }
}
