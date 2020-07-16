import 'package:flutter/material.dart';
import 'package:report/bar.dart';
import 'package:report/day.dart';
import 'package:report/mood_record.dart';
import 'package:report/take_picture_screen.dart';
import 'package:report/week.dart';

class HomeScreen extends StatelessWidget {
  int id;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                        padding: EdgeInsets.fromLTRB(80,20,0,0),
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
                        padding: EdgeInsets.fromLTRB(0,0,80,0),
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

              GestureDetector(
                onTap: () {
                  print("Tapped a Container");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen(id)),
                  );
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: putcard('膚況檢測')
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print("Tapped a Container");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MoodRecordPage()),
                    );
                  },
                  child: putcard('心情追蹤')
              ),
              GestureDetector(
                  onTap: () {
                    print("Tapped a Container");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Day()),
                    );
                  },
                  child: putcard('每日養顏')
              ),
              GestureDetector(
                  onTap: () {
                    print("Tapped a Container");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Week()),
                    );
                  },
                  child: putcard('每週養顏')
              ),

              Container(
                padding: EdgeInsets.only(top: 60.0),
                child: Text(
                  "Beauty & Health,",
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Make your day.",
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Card putcard(String name){

  return Card(
    margin:
    EdgeInsets.fromLTRB(40, 10, 40, 15),
    elevation: 10,
    child: Container(
      width: 200,
      height: 60,
      child: Center(
        child: Text(
          "$name",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 35.0,

            fontFamily: 'GFSDidot',
            color: const Color(0xFF818181),
          ),
        ),
      ),
    ),
  );
}


