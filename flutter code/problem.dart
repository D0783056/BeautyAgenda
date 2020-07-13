import 'package:beauty_agenda/week_menu.dart';
import 'package:flutter/material.dart';
import 'week_menu.dart';

class ProblemPage extends StatefulWidget {
  @override
  _ProblemPageState createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  Label label = new Label();
  String problem_title = '黑眼圈';
  String why = '過度曝曬';
  String information = '        建議你做好防曬，外出可以撐陽傘，補充一些抗曬的營養素';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          label.label('$problem_title'),
          Container(
            margin: EdgeInsets.fromLTRB(45, 20, 30, 0),
            child: Text(
              '你有$problem_title喔!\n經過影像的判斷和你的作息做比對後，發現你發現可能的成因有下列幾點:',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Icon(
                  Icons.fiber_manual_record,
                  size: 15,
                  color: Color(0XFF818181),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 30, 0),
                child: Text(
                  '$why',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'GFDSidot',
                    color: Color(0XFF818181),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(45, 10, 30, 50),
            child: Text(
              '$information',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 500,
              padding: EdgeInsets.only(right: 22.0, top: 10.0, bottom: 100.0),
              child: Text(
                "點擊看養顏建議",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18.0,
                  color: const Color(0xFF818181),
                ),
              ),
            ),
          ),

          Row(//TODO 置底
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.unfold_more,
                size: 20,
                color: Colors.grey,
              ),
              Text(
                '上下滑動',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily:'GFDSidot',
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}