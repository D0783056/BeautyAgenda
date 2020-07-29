import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'history_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Testdate extends StatefulWidget {
  String year;
  String month;
  String day;
  String nowtime;
  int id;
  Testdate({this.year,this.month,this.day,this.nowtime,this.id});

  @override
  _TestdateState createState() => _TestdateState(year,month,day,nowtime,id);
}

class _TestdateState extends State<Testdate> {

  String year;
  String month;
  String day;
  String nowtime;
  int id;
  _TestdateState(this.year,this.month,this.day,this.nowtime,this.id);

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
    print("date_List $id");
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Center(
        child: GestureDetector(
          onTap: () {
            _save();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => History_bar(id)),
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