import 'package:flutter/material.dart';
import 'cause.dart';

// ignore: must_be_immutable
class ProblemPage extends StatefulWidget {
  var test;
  int id;
  ProblemPage(this.test,this.id);

  @override
  _ProblemPageState createState() => _ProblemPageState(test,id);
}

class _ProblemPageState extends State<ProblemPage> {
  var test;
  int id;
  _ProblemPageState(this.test,this.id);

  @override
  Widget build(BuildContext context) {
    Cause object = Cause(test);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          object.causes1(),
          object.causes2(),
          object.causes3(),
          object.causes4(),
          object.causes5(),
          object.causes6(),
          object.causes7(),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 500,
              padding: EdgeInsets.only(right: 22.0, top: 50.0, bottom: 100.0),
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