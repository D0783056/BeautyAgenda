import 'take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'history_day.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mainButton.dart';
import 'skin.dart';

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
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 220, 0, 10),
                            child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Color(0XFF818181))),
                          ),
                          Text(
                            "loading...",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'GFDSidot',
                                color: Color(0XFF818181)),
                          ),
                          SizedBox(height: 200),
                        ],
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.fromLTRB(50, 50, 20, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  'Dear$username,  你成功堅持$useday天',
                                  style: TextStyle(
                                    color: Color(0XFF818181),
                                    fontFamily: 'GFSDidot',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                                Icon(Icons.favorite)
                              ],
                            ),
                            SizedBox(height: 80),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: Image.asset(
                                                  'images/icon.jpg'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Button(
                                        name: "檢測歷史",
                                        onPress: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    History_day(id)),
                                          );
                                        }),
                                    Button(
                                        name: "膚況變化",
                                        onPress: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Skin(id),
                                              ));
                                        }),
                                    Button(
                                        name: "個人問卷",
                                        onPress: () {
                                          //TODO 問卷還沒做完
                                        })
                                  ],
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 40, 20, 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Beauty & Health,",
                                      style: TextStyle(
                                        fontFamily: 'GFSDidot',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: const Color(0xFF818181),
                                      ),
                                    ),
                                    Text(
                                      "Make your day.",
                                      style: TextStyle(
                                        fontFamily: 'GFSDidot',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: const Color(0xFF818181),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
