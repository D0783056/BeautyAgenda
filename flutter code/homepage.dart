import 'take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'mood_record.dart';
import 'daymenu.dart';
import 'week.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int id = 0;
  HomePage(int id) {
    this.id = id;
  }
  HomePageState createState() => HomePageState(id);
}

class HomePageState extends State {
  int id = 0;
  HomePageState(this.id);

  void pushToCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(id),
      ),
    );
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      setState(() async {
        await prefs.setInt("id", id);
        print('saved $id');
      });
    } catch (err) {
      err.toString();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(id);
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text('Do you want to log out?'),
          actions: [
            FlatButton(
                child: Text('Yes',style: TextStyle(color: const Color(0xFF818181))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
            ),
            FlatButton(
              child: Text('No',style: TextStyle(color: const Color(0xFF818181))),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            child: Container(
                              color: Color(0XFFFFD0D1),
                              height: 500,
                            )),
                        Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.vertical(
                                    top: Radius.elliptical(50, 50)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () async {
                                              _save();
                                              print("Tapped a Container");
                                              this.pushToCamera(context);
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.fromLTRB(50, 120, 20, 0),
                                                child: putcard('膚況檢測', Icons.face)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () async {
                                              _save();
                                              print("Tapped a Container");
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MoodRecordPage()),
                                              );
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.fromLTRB(20, 120, 50, 0),
                                                child: putcard('心情追蹤', Icons.favorite)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () async {
                                              _save();
                                              print("Tapped a Container");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext context) =>
                                                          DaymenuPage()));
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.fromLTRB(50, 60, 20, 0),
                                                child: putcard('每日養顏', Icons.today)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () async {
                                              _save();
                                              print('123');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Week(id)),
                                              );
                                            },
                                            child: Container(
                                                margin:
                                                EdgeInsets.fromLTRB(20, 60, 50, 0),
                                                child: putcard('每週養顏', Icons.date_range)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //--------------
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 130, 0, 65),
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
                            )),
                      ],
                    ),
                  ),



                ],
              ),
            ),
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
    height: 120,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'GFSDidot',
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
