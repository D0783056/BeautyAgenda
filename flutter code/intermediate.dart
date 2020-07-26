import 'package:flutter/material.dart';
import 'dart:io' as IO;
import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beauty_agenda/bar.dart';

// ignore: must_be_immutable
class IntermediateScreen extends StatefulWidget {
  String imagePath;
  int id;
  int isFront;

  IntermediateScreen(String img, int id, int isFront) {
    this.imagePath = img;
    this.id = id;
    this.isFront = isFront;
  }
  @override
  IntermediateScreenState createState() =>
      IntermediateScreenState(imagePath, id, isFront);
}

class IntermediateScreenState extends State {
  String imagePath;
  int id;
  int isFront;
  var test = new Map<String, dynamic>();

  IntermediateScreenState(this.imagePath, this.id, this.isFront);

  uploadFile() async {
    var request = http.MultipartRequest('POST', Uri.parse("http://140.134.27.136:5000"));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var res = await request.send();
    res.stream.transform(utf8.decoder).listen((value) {
       test = json.decode(value);
       print(test);
    });
  }

  Future userMenu() async {
    var url = 'https://beautyagenda.000webhostapp.com/fruit.php';

    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok1");
    }
  }

  @override
  Widget build(BuildContext context) {
    test = {"acne": false,
            "black circle": true,
            "wrinkle": true};
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color(0xFFFFD0D1),
            leading: IconButton(
              icon: Icon(Icons.person),
              iconSize: 40,
              onPressed: () {
              },
            ),
            title: Center(
              child: Text(
                '膚況檢測',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'GFSDidot',
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),
          preferredSize: Size.fromHeight(60)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            displayImg(imagePath, isFront),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    test.addAll({"id": id});
                    await userMenu();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bar(id, imagePath, isFront, test)),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(54, 15, 0, 25),
                      child: Text('查看結果',
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
    child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: 360,
        height: 516,
        child:
            Image.file(IO.File(imagepath), width: 360, fit: BoxFit.fitWidth)),
    transform: Matrix4.rotationY(mirror),
  );
}
