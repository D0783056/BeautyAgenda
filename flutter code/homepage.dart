import 'package:camera/camera.dart';
import 'take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'mood_record.dart';
import 'daymenu.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int id;
  HomePage(int id) {
    this.id = id;
  }
  void pushToCamera(BuildContext context) async {
    final cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color(0xFFFFD0D1),
              height: 150.0,
              width: double.maxFinite,
              child: Column(
                children: <Widget>[
                  Container(
                      width: 500.0,
                      padding: EdgeInsets.fromLTRB(80, 30, 0, 0),
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
                      padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
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
                this.pushToCamera(context);
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: putcard('膚況檢測')),
            ),
            GestureDetector(
                onTap: () {
                  print("Tapped a Container");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodRecordPage(),
                    ),
                  );
                },
                child: putcard('心情追蹤')),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DaymenuPage(),
                    ),
                  );
                },
                child: putcard('每日養顏')),
            GestureDetector(
                onTap: () {
                  //TODO 導向下一頁
                },
                child: putcard('每週養顏')),
            Container(
              padding: EdgeInsets.only(top: 70.0),
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
              child: Text(
                "Make your day.",
                style: TextStyle(
                  fontFamily: 'GFSDidot',
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: const Color(0xFF818181),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Card putcard(String name) {
  return Card(
    margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
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
