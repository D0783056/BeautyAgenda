import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io' as IO;
import 'package:http/http.dart' as http;
import 'dart:math' as math;

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  String imagePath;
  int id;
  int isFront;
  var test;

  CommentPage(String img, int id, int isFront, var test) {
    this.imagePath = img;
    this.id = id;
    this.isFront = isFront;
    this.test = test;
  }
  @override
  _CommentPageState createState() =>
      _CommentPageState(imagePath, id, isFront, test);
}

class _CommentPageState extends State<CommentPage> {
  var test;
  Image faceImage;
  int grade = 0;
  String imagepath;
  int id;
  int isFront;
  String tmpFile;
  _CommentPageState(this.imagepath, this.id, this.isFront, this.test);
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  String problem1 = "黑眼圈";
  String base64Image;
  String ii;
  var date = DateTime.now();

  Future userRegistration(String fileName) async {
    var url = 'http://140.134.26.187/BeautyAgenda/upload.php';

    var data = {
      'users_id': id,
      'img_name': fileName,
      'base64': base64Image,
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future userDisease() async {
    var url = 'https://beautyagenda.000webhostapp.com/InsertDisease.php';
    print(test);
    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok2");
    }
  }

  Future<List<Symptoms>> getSymptoms() async {
    var url = "https://beautyagenda.000webhostapp.com/symptom.php";
    var response = await http.post(url, body: json.encode(test));
    var message = json.decode(response.body);
    List<Symptoms> symp = [];
    for (var u in message) {
      Symptoms symps = Symptoms(u);
      symp.add(symps);
    }
    return symp;
  }

  Future saveHistory() async {
    var url = 'http://140.134.27.136:5001/saveHistory.php';

    test.addAll({"grade": grade});
    test.addAll({"time": date.toString()});
    test.addAll({"base64": base64Image});
    test.addAll({"isfront": isFront});
    print(test);
    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok3");
    }
  }

  Future userMenu() async {
    var url = 'http://140.134.26.187/BeautyAgenda/fruit.php';
    test.addAll({"id": id});
    print(test);
    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok1");
    }
  }
  @override
  Widget build(BuildContext context) {
    base64Image = base64Encode(IO.File(imagepath).readAsBytesSync());
    grade = 100;
    if (test['acne'] == true) {
      grade -= 9;
    }
    if (test['dark_circle'] == true) {
      grade -= 9;
    }
    if (test['forehead'] == true) {
      grade -= 5;
    }
    if (test['crow'] == true) {
      grade -= 5;
    }
    if (test['smile_line'] == true) {
      grade -= 7;
    }
    if (test['freckle'] == true) {
      grade -= 7;
    }
    if (test['chuan'] == true) {
      grade -= 3;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: getSymptoms(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting && snapshot.data == null) {
                    return Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 250, 0, 10),
                            child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0XFF818181))),
                          ),
                        ),
                        Center(
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
                  } else {
                    return Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey , width: 2),
                          ),
                          margin: EdgeInsets.fromLTRB(100, 20, 100, 40),
                          child: Container(
                            width: 200,
                            height: 280,
                            child: displayImg(imagepath, isFront),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 210, 10),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: Colors.grey , width: 2),
                                ),
                                height: 50,
                                width: 95,
                                child: Center(
                                  child: Text(
                                    '$grade',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ))),
                        Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 5),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: Colors.grey , width: 2),
                                ),
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                height: 300,
                                width: double.maxFinite,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      //TODO 顯示排版
                                      "$how",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0XFF818181)),
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                                          itemBuilder: (BuildContext context, int id) {
                                            return Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Icon(
                                                      Icons.fiber_manual_record,
                                                      size: 15,
                                                      color: Color(0XFF818181),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      snapshot.data[id].symptom,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'GFDSidot',
                                                          color: Color(0XFF818181)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ))),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                await userMenu();
                                await userDisease();
                                await saveHistory();
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(180, 20, 0, 25),
                                  child: Text('儲存',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'GFDSidot',
                                          color: Color(0XFF818181)))),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Widget displayImg(String imagepath, int isFront) {
  double mirror;
  if (isFront == 1) {
    mirror = math.pi;
  } else {
    mirror = 0;
  }

  return Transform(
    alignment: Alignment.center,
    child: Image.file(IO.File(imagepath), width: 320, fit: BoxFit.fill),
    transform: Matrix4.rotationY(mirror),
  );
}

class Symptoms {
  final String symptom;
  Symptoms(this.symptom);
}
