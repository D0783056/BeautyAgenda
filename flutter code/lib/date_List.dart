import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report/history_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Testdate extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String nowtime;

  Testdate({this.year,this.month,this.day,this.nowtime});

  @override
  _TestdateState createState() => _TestdateState(year,month,day,nowtime);
}

class _TestdateState extends State<Testdate> {

  final String year;
  final String month;
  final String day;
  final String nowtime;
  _TestdateState(this.year,this.month,this.day,this.nowtime);

  _save() async {
    print(nowtime);
    final prefs = await SharedPreferences.getInstance();
    try {
      setState(() async {
        await prefs.setString("nowtime", nowtime);
        print('saved $nowtime');
      });
    } catch (err) {
      err.toString();
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Center(
        child: GestureDetector(
          onTap: () {
            _save();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => History_bar()),
            );
          },
          child: Text(
            '${widget.year} / ${widget.month} / ${widget.day}',
            style: TextStyle(
              fontSize: 30,
              color: Color(0XFF818181),
            ),
          ),
        ),
      ),
    );
  }
}