import 'package:flutter/material.dart';
import 'dart:io' as IO;
import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bar.dart';

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

  @override
  void initState() {
    uploadFile();
    super.initState();
  }

  Future uploadFile() async {
    var request = http.MultipartRequest('POST', Uri.parse("http://140.134.26.187:5000"));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var res = await request.send();
    res.stream.transform(utf8.decoder).listen((value) async {
      test = await jsonDecode(value);
    });
    print(test);
  }

  Future userMenu() async {
    var url = 'https://140.134.26.187/BeautyAgenda/fruit.php';

    var response = await http.post(url, body: json.encode(test));
    if (response.statusCode == 200) {
      print("ok1");
    }
  }

  void isFace() {
    if (test['is_no_face'] == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: new Text("明明就不是人臉! 給我重拍!"),
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
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bar(id, imagePath, isFront, test)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Toptitle toptitle = new Toptitle();
    return Scaffold(
      appBar: toptitle.Topbar(context, 'Beauty Agenda', id),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            displayImg(imagePath, isFront),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    isFace();
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(54, 25, 0, 15),
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
                      margin: EdgeInsets.fromLTRB(70, 25, 0, 15),
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
        height: 520,
        child: Image.file(IO.File(imagepath), width: 324, fit: BoxFit.fill)),
    transform: Matrix4.rotationY(mirror),
  );
}
