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
                              margin: EdgeInsets.fromLTRB(50, 50, 20, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Dear$username,   你成功堅持$useday天',
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
                            );
                          }
                        },
                      ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100,
                                  width: 100,
                                  child:Image.asset('images/icon.jpg'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }
}

Widget putcard(String name, IconData icon) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500], width: 2.5),
        borderRadius: new BorderRadius.all(Radius.circular(20))),
    width: 120,
    height: 60,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'GFDSidiot',
            color: Color(0XFF818181),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          size: 45,
          color: Color(0XFF818181),
        )
      ],
    ),
  );
}
