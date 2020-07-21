import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class WeekmenuPage extends StatefulWidget {
  @override
  _WeekmenuPageState createState() => _WeekmenuPageState();
}

class _WeekmenuPageState extends State<WeekmenuPage> {
  Label label = new Label();
  Degree complete = new Degree();
  double dot = 0.0;
  Image faceImage;
  int grade = 10;
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  String problem1 = "黑眼圈";
  int id;
  Color red = Color(0xFFFFD0D1);
  Color white = Colors.white;
  Color colorDecide;

  var recommend = {
    "維生素A": 8100,
    "維生素B": 3000,
    "維生素C": 3600,
    "維生素D": 4500,
    "維生素E": 6700
  };

  @override
  void initState() {
    Timer.run(() => showAlert(context));
    _readCount();
    _readId();
    super.initState();
  }

  _readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      id = value;
    });
  }

  _readCount() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'count';
    final value = prefs.getDouble(key) ?? 0.0;
    setState(() {
      dot = value;
    });
  }

  Future<List<Intake>> _getIntake() async {
    var url = "https://beautyagenda.000webhostapp.com/intake.php";
    var data = {'id': id};

    var response = await http.post(url, body: json.encode(data));
    var message = json.decode(response.body);
    List<Intake> intake = [];

    for (var u in message) {
      Intake fruitmenu = Intake(int.parse(u["id"]), u["elements"]);
      intake.add(fruitmenu);
    }
    return intake;
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.lightbulb_outline,
                          color: Color(0xFF818181), size: 30),
                      SizedBox(width: 5),
                      Text(
                        "小提示",
                        style: TextStyle(
                            fontFamily: 'GFSDidot',
                            fontSize: 22,
                            color: Color(0xFF818181)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "這裡會紀錄你這週的營養素攝取總量，和實際營養素攝取量，要努力完成喔 !",
                    style: TextStyle(
                        fontFamily: 'GFSDidot',
                        fontSize: 20,
                        color: Color(0xFF818181)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ));
  }

  //TODO 狀況變數尚未決定
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          label.label('建議攝取量'),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: FutureBuilder(
                future: _getIntake(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting && snapshot.data == null) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: CircularProgressIndicator(),
                        ),
                        Text(
                          "loading...",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF818181),
                              fontFamily: 'GFSDidot'),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int id) {
                          if (id % 2 == 0) {
                            colorDecide = red;
                          } else {
                            colorDecide = white;
                          }
                          return label.item(
                              snapshot.data[id].elements,
                              recommend[snapshot.data[id].elements],
                              colorDecide);
                        });
                  } else {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Text(
                        "目前查無資料",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF818181),
                            fontFamily: 'GFSDidot'),
                      ),
                    );
                  }
                }),
          ),
          SizedBox(height: 30),
          label.label('實際攝取量'),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: FutureBuilder(
                future: _getIntake(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: CircularProgressIndicator(),
                        ),
                        Text(
                          "loading...",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF818181),
                              fontFamily: 'GFSDidot'),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              color: Color(0XFFF0EFEF),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: Card(
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor:
                                      AlwaysStoppedAnimation(Color(0XFFB2AFAF)),
                                  value: dot,
                                ),
                                elevation: 10.0),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 30.0,
                                  child: Text(
                                    '0%', //營養素名稱
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GFDSidot',
                                      color: Color(0XFF818181),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 30.0,
                                  child: Text(
                                    '50%', //營養素名稱
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GFDSidot',
                                      color: Color(0XFF818181),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 30.0,
                                  child: Text(
                                    '100%',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GFDSidot',
                                      color: Color(0XFF818181),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int id) {
                              if (id % 2 == 0) {
                                colorDecide = red;
                              } else {
                                colorDecide = white;
                              }
                              return label.item(
                                  snapshot.data[id].elements,
                                  recommend[snapshot.data[id].elements],
                                  colorDecide);
                            }),
                      ],
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Text(
                        "目前查無資料",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF818181),
                            fontFamily: 'GFSDidot'),
                      ),
                    );
                  }
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 90.0),
            child: Text(
              "Almost there. Hold your horses!",
              style: TextStyle(
                fontFamily: 'GFSDidot',
                fontSize: 22.0,
                color: const Color(0xFF818181),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Label {
  Container label(String labelname) {
    // 小標
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 50,
            width: 20,
            color: Color(0xFFFFD0D1),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '$labelname',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container item(String nutrients, int intake, Color color) {
    //攝取營養素項目
    return Container(
      color: color, //整條項目的背景顏色
      width: double.maxFinite,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 30),
              height: 30.0,
              child: Text(
                '$nutrients', //營養素名稱
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'GFDSidot',
                  color: Color(0XFF818181),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 30.0,
              child: Text(
                '$intake毫克', //攝取量
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'GFDSidot',
                  color: Color(0XFF818181),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Degree {
  double degree;

  double getDegree() {
    return this.degree;
  }
}

class Intake {
  final int id;
  final String elements;

  Intake(this.id, this.elements);
}
