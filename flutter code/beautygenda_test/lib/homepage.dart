import 'package:beauty_agenda/history_day.dart';
import 'package:beauty_agenda/skin.dart';

import 'take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int id;
  HomePage(int id) {
    this.id = id;
  }
  HomePageState createState() => HomePageState(id);
}

class HomePageState extends State {
  int id;
  int useday = 0;
  String username;

  HomePageState(this.id);
  GlobalKey<NavigatorState> _key = GlobalKey();
  Future getName() async {
    var gradeurl = 'http://140.134.26.187/BeautyAgenda/getName.php';

    var User_id = {
      'id': id,
    };
    http.Response res = await http.post(gradeurl, body: json.encode(User_id));
    String jsonDataString = res.body.toString();
    var getName = jsonDecode(jsonDataString);
    username = getName.toString().substring(7, getName.toString().length - 2);
    return username;
  }

  void pushToCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(id),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(id);
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
                  Container(
                      child: FutureBuilder<dynamic>(
                        future: getName(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting &&
                              snapshot.data == null) {
                            return Container(
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.fromLTRB(50, 80, 20, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Dear$username,   你成功堅持$useday天',
                                    style: TextStyle(
                                      color: Color(0XFF818181),
                                      fontFamily: 'GFSDidot',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.0,
                                    ),
                                  ),
                                  Icon(Icons.favorite)
                                ],
                              ),
                            );
                          }
                        },
                      ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(50, 60, 20, 0),
                            height: 130,
                            width: 130,
                            child:Image.asset('images/icon.jpg'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => History_day(id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      child: putcard('檢測歷史')),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Skin(id)),
                                    );
                                  },
                                  child: Container(
                                      child: putcard('膚況變化')),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () async {
                                    print("Tapped a Container");
                                  },
                                  child: Container(
                                      child: putcard('體質問卷')),
                                ),
                              ),
                            ],
                          ),
                        ),)
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Beauty & Health,",
                            style: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 20.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          Text(
                            "Make your Day.",
                            style: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 20.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
  }
}

Widget putcard(String name) {
  return Container(
    margin: EdgeInsets.only(bottom: 10,top: 30),
    decoration: BoxDecoration(
      color: Colors.grey[300],
        borderRadius: new BorderRadius.all(Radius.circular(10))),
    width: 120,
    height: 40,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'GFDSidiot',
            color: Colors.grey[700],
          ),
        ),
        SizedBox(
          height: 5,
        ),

      ],
    ),
  );
}
