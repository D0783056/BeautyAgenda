import 'package:flutter/material.dart';
import 'package:fluttertest/Question.dart';
import 'package:fluttertest/questionnaire.dart';
import 'history_Cause.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'BottomNavigationBar.dart';
import 'suggest.dart';

// ignore: must_be_immutable, camel_case_types
class habit extends StatefulWidget {
  int id;
  habit(this.id);

  @override
  _habitState createState() => _habitState(id);
}

class _habitState extends State<habit> {
  int ii;
  String nowtime;
  var u;
  var problem;
  var body;
  History_Cause object;
  _habitState(this.ii);

  _readnowtime() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'nowtime';
    final value = prefs.getString(key) ?? null;
    setState(() {
      nowtime = value;
    });
  }

  Future getBody() async {
    var gradeurl = 'http://140.134.26.187/BeautyAgenda/getbody.php';

    var User_id = {
      'id': ii,
    };

    http.Response res = await http.post(gradeurl, body: json.encode(User_id));
    String jsonDataString = res.body.toString();
    var getName = jsonDecode(jsonDataString);
    problem = getName.toString().substring(7, getName.toString().length - 2);
    return problem;
  }
  @override
  void initState() {
    _readnowtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    habit_problem test = new habit_problem();
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFD0D1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigation(ii),
              ),
            );
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Center(
          child: Text(
            '個人表單',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'GFSDidot',
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder<dynamic>(
              future: getBody(),
              builder: (BuildContext context , AsyncSnapshot snapshpt){
                if(snapshpt.connectionState == ConnectionState.waiting && snapshpt.data == null){
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(140, 250, 0, 10),
                        child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0XFF818181))),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(140, 0, 0, 10),
                        child: Text(
                          "loading...",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'GFDSidot',
                              color: Color(0XFF818181)),
                        ),
                      ),
                      SizedBox(height: 200),
                    ],
                  );
                }
                else if(snapshpt.hasData) {

                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshpt.data.length,
                      itemBuilder: (BuildContext context, int id) {
                        body = snapshpt.data[id];
                        test.body = body;
                        if(id ==1) {
                          print(body);
                        return Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child:Text("根據最近的問卷結果顯示",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'GFSDidot',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF818181),
                                    fontSize: 25)),
                          ),
                          Center(

                            child:Text("你有以下的生活習慣： ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'GFSDidot',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF818181),
                                    fontSize: 25)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          test.Body(),
                          test.suggest_print(),
                          Container(
                            margin: EdgeInsets.fromLTRB(40, 10, 50, 0),
                            height: 50.0,
                            width: 135.0,
                            child: RaisedButton(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                              color: Colors.grey[350],
                              child: Text(
                                "重新填寫",
                                style: TextStyle(
                                    fontFamily: 'GFSDidot',
                                    fontSize: 25.0,
                                    color: Colors.grey[700]),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Questionnaire(ii),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],);}
                        else {
                          return Container();
                        }
                      });

                } else {
                  return Container(

                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

/*
* return Container(
                    child: Column(
                      children: [//
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child:Text("根據最近的問卷結果顯示",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'GFSDidot',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF818181),
                                  fontSize: 25)),
                        ),
                        Center(
                          child:Text("你有以下的生活習慣： ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'GFSDidot',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF818181),
                                  fontSize: 25)),
                        ),
                        Container()
                      ],
                    ),
                  );
* */