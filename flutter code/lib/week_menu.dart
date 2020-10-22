import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
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
  int count = 0;
  bool _isCheck1 = false;
  bool _isCheck2 = false;
  bool _isCheck3 = false;
  var intake;
  var recommend = {
    "維他命A": 4100,
    "維生素A": 8100,
    "維生素B": 3000,
    "維生素C": 3600,
    "維生素D": 4500,
    "維生素E": 6700,
    "鋅": 3000,
    "茄紅素": 3560,
    "β胡蘿蔔素": 1200,
    "兒茶素": 1300,
    "花青素": 1800,
    "ω-3脂肪酸": 900,
    "菸鹼酸": 2350,
    "Omega-3脂肪酸": 1900,
    "檸檬酸": 1568,
    "果酸": 1400,
    "β-胡蘿蔔素": 1360,
    "山茶酚": 1600,
    "鈣": 1000,
    "鎂": 1500,
    "鐵": 2300,
    "亞麻油酸": 1700,
    "次亞麻油酸": 600,
    "蛋白質": 1600,
    "鉀": 300,
    "磷": 100,
    "銀耳多醣體": 200,
    "軟骨素": 560
  };

  _read(String box) async {
    final prefs = await SharedPreferences.getInstance();
    final key = box;
    final value = prefs.getBool(key) ?? false;
    setState(() {
      if (box == "box1") {
        _isCheck1 = value;
      } else if (box == "box2") {
        _isCheck2 = value;
      } else if (box == "box3") {
        _isCheck3 = value;
      }
    });
  }

  @override
  void initState() {
    _read("box1");
    _read("box2");
    _read("box3");
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
    var url = "http://140.134.27.136:5001/intake.php";
    var data = {'id': id};

    var response = await http.post(url, body: json.encode(data));
    var message = json.decode(response.body);
    List<Intake> intake = [];

    for (var u in message) {
      Intake fruitmenu = Intake(u["elements"]);
      intake.add(fruitmenu);
    }
    return intake;
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[250],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                        fontFamily: 'NotoSansTC',
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

  void weekintake() {
    var rng = new Random();
    if (_isCheck1 == true) {
      count++;
    }
    if (_isCheck2 == true) {
      count++;
    }
    if (_isCheck3 == true) {
      count++;
    }
    if (count == 1) {
      intake = {
        "維他命A": rng.nextInt(100) + 30,
        "維生素A": rng.nextInt(100) + 30,
        "維生素B": rng.nextInt(100) + 30,
        "維生素C": rng.nextInt(100) + 30,
        "維生素D": rng.nextInt(100) + 30,
        "維生素E": rng.nextInt(100) + 30,
        "鋅": rng.nextInt(100) + 30,
        "茄紅素": rng.nextInt(100) + 30,
        "β胡蘿蔔素": rng.nextInt(100) + 30,
        "兒茶素": rng.nextInt(100) + 30,
        "花青素": rng.nextInt(100) + 30,
        "ω-3脂肪酸": rng.nextInt(100) + 30,
        "菸鹼酸": rng.nextInt(100) + 30,
        "Omega-3脂肪酸": rng.nextInt(100) + 30,
        "檸檬酸": rng.nextInt(100) + 30,
        "果酸": rng.nextInt(100) + 30,
        "β-胡蘿蔔素": rng.nextInt(100) + 30,
        "山茶酚": rng.nextInt(100) + 30,
        "鈣": rng.nextInt(100) + 30,
        "鎂": rng.nextInt(100) + 30,
        "鐵": rng.nextInt(100) + 30,
        "亞麻油酸": rng.nextInt(100) + 30,
        "次亞麻油酸": rng.nextInt(100) + 30,
        "蛋白質": rng.nextInt(100) + 30,
        "鉀": rng.nextInt(100) + 30,
        "磷": rng.nextInt(100) + 30,
        "銀耳多醣體": rng.nextInt(100) + 30,
        "軟骨素": rng.nextInt(100) + 30
      };
    } else if (count == 2) {
      intake = {
        "維他命A": rng.nextInt(120) + 50,
        "維生素A": rng.nextInt(120) + 50,
        "維生素B": rng.nextInt(120) + 50,
        "維生素C": rng.nextInt(120) + 50,
        "維生素D": rng.nextInt(120) + 50,
        "維生素E": rng.nextInt(120) + 50,
        "鋅": rng.nextInt(120) + 50,
        "茄紅素": rng.nextInt(120) + 50,
        "β胡蘿蔔素": rng.nextInt(120) + 50,
        "兒茶素": rng.nextInt(120) + 50,
        "花青素": rng.nextInt(120) + 50,
        "ω-3脂肪酸": rng.nextInt(120) + 50,
        "菸鹼酸": rng.nextInt(120) + 50,
        "Omega-3脂肪酸": rng.nextInt(120) + 50,
        "檸檬酸": rng.nextInt(120) + 50,
        "果酸": rng.nextInt(120) + 50,
        "β-胡蘿蔔素": rng.nextInt(120) + 50,
        "山茶酚": rng.nextInt(120) + 50,
        "鈣": rng.nextInt(120) + 50,
        "鎂": rng.nextInt(120) + 50,
        "鐵": rng.nextInt(120) + 50,
        "亞麻油酸": rng.nextInt(120) + 50,
        "次亞麻油酸": rng.nextInt(120) + 50,
        "蛋白質": rng.nextInt(120) + 50,
        "鉀": rng.nextInt(120) + 50,
        "磷": rng.nextInt(120) + 50,
        "銀耳多醣體": rng.nextInt(120) + 50,
        "軟骨素": rng.nextInt(120) + 50
      };
    } else if (count == 3) {
      intake = {
        "維他命A": rng.nextInt(150) + 70,
        "維生素A": rng.nextInt(150) + 70,
        "維生素B": rng.nextInt(150) + 70,
        "維生素C": rng.nextInt(150) + 70,
        "維生素D": rng.nextInt(150) + 70,
        "維生素E": rng.nextInt(150) + 70,
        "鋅": rng.nextInt(150) + 70,
        "茄紅素": rng.nextInt(150) + 70,
        "β胡蘿蔔素": rng.nextInt(150) + 70,
        "兒茶素": rng.nextInt(150) + 70,
        "花青素": rng.nextInt(150) + 70,
        "ω-3脂肪酸": rng.nextInt(150) + 70,
        "菸鹼酸": rng.nextInt(150) + 70,
        "Omega-3脂肪酸": rng.nextInt(150) + 70,
        "檸檬酸": rng.nextInt(150) + 70,
        "果酸": rng.nextInt(150) + 70,
        "β-胡蘿蔔素": rng.nextInt(150) + 70,
        "山茶酚": rng.nextInt(150) + 70,
        "鈣": rng.nextInt(150) + 70,
        "鎂": rng.nextInt(150) + 70,
        "鐵": rng.nextInt(150) + 70,
        "亞麻油酸": rng.nextInt(150) + 70,
        "次亞麻油酸": rng.nextInt(150) + 70,
        "蛋白質": rng.nextInt(150) + 70,
        "鉀": rng.nextInt(150) + 70,
        "磷": rng.nextInt(150) + 70,
        "銀耳多醣體": rng.nextInt(150) + 70,
        "軟骨素": rng.nextInt(150) + 70
      };
    } else {
      intake = {
        "維他命A": 0,
        "維生素A": 0,
        "維生素B": 0,
        "維生素C": 0,
        "維生素D": 0,
        "維生素E": 0,
        "鋅": 0,
        "茄紅素": 0,
        "β胡蘿蔔素": 0,
        "兒茶素": 0,
        "花青素": 0,
        "ω-3脂肪酸": 0,
        "菸鹼酸": 0,
        "Omega-3脂肪酸": 0,
        "檸檬酸": 0,
        "果酸": 0,
        "β-胡蘿蔔素": 0,
        "山茶酚": 0,
        "鈣": 0,
        "鎂": 0,
        "鐵": 0,
        "亞麻油酸": 0,
        "次亞麻油酸": 0,
        "蛋白質": 0,
        "鉀": 0,
        "磷": 0,
        "銀耳多醣體": 0,
        "軟骨素": 0
      };
    }
  }

  //TODO 狀況變數尚未決定
  @override
  Widget build(BuildContext context) {
    weekintake();
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
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Color(0XFF818181))),
                            ),
                            Text(
                              "loading...",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF818181),
                              ),
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
                            "目前尚無資料",
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
                              child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Color(0XFF818181))),
                            ),
                            Text(
                              "loading...",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF818181),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 35),
                          child: Column(
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
                                margin: EdgeInsets.only(bottom: 30),
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
                                        intake[snapshot.data[id].elements],
                                        colorDecide);
                                  }),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Text(
                            "目前尚無資料",
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
                height: 60,
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
                fontSize: 25,
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
                  fontSize: 20,
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
  final String elements;

  Intake(this.elements);
}