import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io' as IO;
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  String imagePath;
  int id;
  CommentPage(String img, int id) {
    this.imagePath = img;
    this.id = id;
  }
  @override
  _CommentPageState createState() => _CommentPageState(imagePath, id);
}

class _CommentPageState extends State<CommentPage> {
  Image faceImage;
  int grade = 10;
  String imagepath;
  int id;
  String tmpFile;
  _CommentPageState(this.imagepath, this.id);
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  String problem1 = "黑眼圈";
  String base64Image;
  var test = new Map<String, dynamic>();
  var date = new DateTime.now();


  Future userRegistration(String fileName) async {
    var url = 'http://140.134.27.136:5001/upload.php';

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

  Future saveHistory() async {
    var url = 'http://140.134.27.136:5001/saveHistory.php';

    test.addAll({"id": id});
    test.addAll({"grade": grade});
    test.addAll({"time": date.toString()});
    test.addAll({"base64": base64Image});
    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok2");
    }
  }

  @override
  Widget build(BuildContext context) {
    base64Image = base64Encode(IO.File(imagepath).readAsBytesSync());
    test = {
      "forehead": true,
      "chuan": false,
      "crow": false,
      "dark_circle": false,
      "smile_line": true,
      "acne": false,
      "freckle": true
    };
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(100, 20, 100, 40),
            child: Container(
              width: 200,
              height: 250,
              child: Image.file(IO.File(imagepath), fit: BoxFit.fill),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[400],
                  width: 2,
                ),
                borderRadius:BorderRadius.circular(5),
              ),
              margin: EdgeInsets.fromLTRB(50, 0, 0, 10),
              child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      '$grade',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ))),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[400],
                  width: 2,
                ),
                borderRadius:BorderRadius.circular(5),
              ),
              margin: EdgeInsets.fromLTRB(50, 0, 50, 5),
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 300,
                  width: double.maxFinite,
                  child: Column(
                    children: <Widget>[
                      Text(
                        //TODO 顯示排版
                        "$how",
                        style:
                        TextStyle(fontSize: 20, color: Color(0XFF818181)),
                      ),
                      Container(
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
                                '$problem1',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'GFDSidot',
                                    color: Color(0XFF818181)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async{
                  //String fileName = imagepath.split('/').last;
                  //userRegistration(fileName);
                  await saveHistory();
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(80, 15, 0, 25),
                    child: Text('儲存',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GFDSidot',
                            color: Color(0XFF818181)))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(70, 15, 0, 25),
                    child: Text('沒拍好? 在拍一張!',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GFDSidot',
                            color: Color(0XFF818181)))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}