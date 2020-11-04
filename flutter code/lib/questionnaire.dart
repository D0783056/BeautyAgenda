import 'package:flutter/material.dart';
import 'Question.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Questionnaire extends StatefulWidget {
  QuestionnaireState createState() => QuestionnaireState();
}

class QuestionnaireState extends State {
  List<String> _checked1 = [];
  List<String> _checked2 = [];
  List<String> _checked3 = [];
  List<String> _checked4 = [];
  List<String> _checked5 = [];

  QuestionnaireState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: const Color(0xFFFFD0D1),
                height: 180.0,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.fromLTRB(80, 40, 0, 0),
                        child: Text(
                          "Beauty",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'GFSDidot',
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.fromLTRB(0, 10, 80, 0),
                        child: Text(
                          "Agenda",
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                            fontFamily: 'GFSDidot',
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("請先完成以下問卷，以便提升辨識準確度!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GFSDidot',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF818181),
                      fontSize: 20)),
              SizedBox(height:20),
              Container(
                child: Column(
                  children: <Widget>[
                    Question(
                        name: "Q1. 最近常吃甜食?",
                        checked: _checked1,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked1 = selected;
                        }), alignText: 130),
                    Question(
                        name: "Q2. 最近常曝曬在陽光下?",
                        checked: _checked2,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked2 = selected;
                        }), alignText: 50),
                    Question(
                        name: "Q3. 最近常吃油炸食物?",
                        checked: _checked3,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked3 = selected;
                        }), alignText: 80),
                    Question(
                        name: "Q4. 最近過度清潔臉部?",
                        checked: _checked4,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked4 = selected;
                        }), alignText: 80),
                    Question(
                        name: "Q5. 最近常揉眼睛?",
                        checked: _checked5,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked5 = selected;
                        }), alignText: 120),
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 30, 50, 30),
                      height: 50.0,
                      width: 135.0,
                      child: RaisedButton(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                        color: Colors.grey[350],
                        child: Text(
                          "送出",
                          style: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 25.0,
                              color: Colors.grey[700]),
                        ),
                        onPressed: ()  {
                          if(isAllChecked(_checked1, _checked2, _checked3, _checked4, _checked5) == true) {
                            print(getScore(_checked1, _checked2, _checked3, _checked4, _checked5));
                          } else {
                            Fluttertoast.showToast(
                              msg: "上有選項尚未勾選!", backgroundColor: Colors.grey,);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isAllChecked(List<String> c1, List<String> c2, List<String> c3, List<String> c4, List<String> c5) {
  if(c1.length == 0 || c2.length == 0 || c3.length == 0 || c4.length == 0 || c5.length == 0) {
    return false;
  } else {
    return true;
  }
}

int getScore(List<String> c1, List<String> c2, List<String> c3, List<String> c4, List<String> c5) {
  int sum = 0;
  var score = {
    "完全不會": 0,
    "幾乎不會": 1,
    "經常會": 2,
    "偶爾會": 3,
    "會": 4
  };
  sum = score[c1[0]] + score[c2[0]] + score[c3[0]] + score[c4[0]] + score[c5[0]];
  return sum;
}
