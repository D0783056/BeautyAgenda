import 'package:beauty_agenda/history_day.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'history_choose.dart';
import 'bar.dart';

// ignore: must_be_immutable, camel_case_types
class History_bar extends StatelessWidget {
  int id;
  History_bar(this.id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _History_bar(id),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
// ignore: must_be_immutable, camel_case_types
class _History_bar extends StatelessWidget {
  _History_bar(this.id);
  int id;
  String username = '李亞璇';
  // ignore: non_constant_identifier_names
  Toptitle toptitle = new Toptitle();

  @override
  Widget build(BuildContext context) {
    print("history_bar $id");
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);
    History_tabs history_tabs = new History_tabs(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD0D1),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => History_day(id),
              ),
            );
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Center(
          child: Text(
            '檢測歷史',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'GFSDidot',
            ),
          ),
        ),
      ),
      body: history_tabs,
    );
  }
}
