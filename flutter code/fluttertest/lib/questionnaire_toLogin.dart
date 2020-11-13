import 'package:fluttertest/BottomNavigationBar.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'function.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Questionnaire_toLogin extends StatefulWidget {
  int id;
  Questionnaire_toLogin(int id) {
    this.id = id;
  }
  Questionnaire_toLoginState createState() => Questionnaire_toLoginState(id);
}

class Questionnaire_toLoginState extends State {

  bool visible = false;
  int id;

  List<String> _checked1 = [];
  List<String> _checked2 = [];
  List<String> _checked3 = [];
  List<String> _checked4 = [];
  List<String> _checked5 = [];
  List<String> _checked6 = [];
  List<String> _checked7 = [];
  List<String> _checked8 = [];
  String bodySituation;
  int score;
  Questionnaire_toLoginState(int id){
    this.id = id;
  }

  @override
  void initState() {
    super.initState();
  }

  Future insertBody() async {

    setState(() {
      visible = true;
    });

    //TODO 阿吉要改成你自己SERVER的PHP檔名稱
    var url = 'http://140.134.26.187/BeautyAgenda/body.php';
    var data = {'id': id, 'body': bodySituation};
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: new Text(message,textAlign: TextAlign.center),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
              ),
            ],
          );
        },
      );
    }
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
                height: 140.0,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.fromLTRB(30, 60, 0, 0),
                        child: Text(
                          "Beauty Agenda",
                          textAlign: TextAlign.left,
                          style: TextStyle(
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
                    Question(
                        name: "Q6. 最近常常熬夜?",
                        checked: _checked6,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked6 = selected;
                        }), alignText: 120),
                    Question(
                        name: "Q7. 最近三餐時間不固定?",
                        checked: _checked7,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked7 = selected;
                        }), alignText: 50),
                    Question(
                        name: "Q8. 最近常常吃消夜?",
                        checked: _checked8,
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          _checked8 = selected;
                        }), alignText: 100),
                    Visibility(
                        visible: visible,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation(
                                    Color(0XFF818181))
                            ))),
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 30, 50, 10),
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
                        onPressed: () async {
                          if(isAllChecked(_checked1, _checked2, _checked3, _checked4, _checked5, _checked6, _checked7, _checked8) == true) {
                            bodySituation = getScore(_checked1, _checked2, _checked3, _checked4, _checked5, _checked6, _checked7, _checked8);
                            await insertBody();
                          } else {
                            Fluttertoast.showToast(msg: "上有選項尚未勾選!", backgroundColor: Colors.grey,);
                            return;
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