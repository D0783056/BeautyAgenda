import 'dart:async';
import 'package:beauty_agenda/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'week_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'nutrient.dart';
import 'drawer.dart';
import 'bar.dart';

class DaymenuPage extends StatefulWidget {
  @override
  _DaymenuPageState createState() => _DaymenuPageState();
}

class _DaymenuPageState extends State<DaymenuPage> {
  var nowTime = new DateTime.now(); //获取当前时间
  Label label = new Label();
  Degree complete = new Degree();
  bool _isCheck1 = false;
  bool _isCheck2 = false;
  bool _isCheck3 = false;
  int flag1 = 0;
  int flag2 = 0;
  int flag3 = 0;
  bool decide = false;
  String text;
  bool temp = false;
  double count = 0.0;
  int id = 0;
  List<String> foodlist = [];
  List<int> foodamount = [];

  var fruits = {
    "柳丁": "orange",
    "橘子": "orange",
    "葡萄": "grape",
    "番茄": "tomato",
    "香蕉": "banana",
    "蘋果": "apple",
    "葡萄柚": "grapefruit",
    "藍莓": "blue_berry",
    "大骨湯": "bone",
    "花椰菜": "broccoli",
    "玉米": "corn",
    "紅蘿蔔": "corrot",
    "蔓越莓": "cranberry",
    "小黃瓜": "cucumber",
    "綠茶": "green_tea",
    "檸檬": "lemon",
    "牛奶": "milk",
    "燕麥": "oat",
    "柚子": "pomelo",
    "鮭魚": "salmon",
    "秋刀魚": "Samma",
    "沙丁魚": "sardine",
    "魚翅": "shark_fin",
    "銀耳": "Tremella",
    "鮪魚": "tuna",
    "地瓜": "yam"
  };

  _readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      id = value;
    });
  }

  _save(String box, bool isCheck) async {
    final prefs = await SharedPreferences.getInstance();
    final key = box;
    final value = isCheck;
    prefs.setBool(key, value);
  }

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

  _saveCount(double add) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'count';
    final value = add;
    prefs.setDouble(key, value);
  }

  Future<List<FruitMenu>> _getMenu() async {
    print(id);
    var url = "http://140.134.26.187/BeautyAgenda/getMenu.php";
    var data = {'id': id};

    var response = await http.post(url, body: json.encode(data));
    var message = json.decode(response.body);
    List<FruitMenu> menu = [];

    for (var u in message) {
      FruitMenu fruitmenu = FruitMenu(int.parse(u["id"]), u["food_name"], int.parse(u["food_nums"]));
      menu.add(fruitmenu);
    }
    return menu;
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
                        fontFamily: 'GFSDidot',
                        fontSize: 22,
                        color: Color(0xFF818181)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "這裡會顯示每天需要攝取的營養素，並且介紹營養素相關資訊，讓你安心跟著Beauty Agenda !",
                style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontSize: 20,
                    color: Color(0xFF818181)),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.check_box, color: Color(0xFF818181), size: 35),
                  SizedBox(width: 10),
                  Text(
                    "食用完畢記得打勾",
                    style: TextStyle(
                        fontFamily: 'GFSDidot',
                        fontSize: 20,
                        color: Color(0xFF818181)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    _readId();
    super.initState();
    _read("box1");
    _read("box2");
    _read("box3");
    Timer.run(() => showAlert(context));
  }

  Widget menuinfo(bool _isCheck, String box, String fruit, int num) {
    String conversion = fruits[fruit];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Container(
              child: Checkbox(
                tristate: false,
                value: _isCheck,
                activeColor: Color(0xFF818181),
                onChanged: (isCheck) async {
                  setState(() {
                    _save(box, isCheck);
                    _read(box);
                  });
                },
              ),
            ),
            Text(
              "$fruit",
              style: TextStyle(
                fontFamily: 'GFSDidot',
                fontSize: 25.0,
                color: const Color(0xFF818181),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "$num個",
              style: TextStyle(
                fontFamily: 'GFSDidot',
                fontSize: 25.0,
                color: const Color(0xFF818181),
              ),
            ),
          ],
        ),
        GestureDetector(
            onLongPress: () {
              Nutrient nutrient = Nutrient(fruit);
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    backgroundColor: Colors.grey[250],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    content: nutrient.elements(),
                  ));
            },
            child: Image.asset('images/$conversion.jpg',
                height: 180, fit: BoxFit.fill))
      ],
    );
  }

  //TODO 狀況變數尚未決定
  @override
  Widget build(BuildContext context) {
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);
    return new Scaffold(
      appBar: Toptitle().Topbar(context,"每日養顏", id),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              label.label('${nowTime.year} / ${nowTime.month} / ${nowTime.day}'),
              Container(
                child: FutureBuilder(
                    future: _getMenu(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 250, 0, 10),
                              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0XFF818181))),
                            ),
                            Text(
                              "loading...",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'GFDSidot',
                                  color: Color(0XFF818181)),
                            ),
                            SizedBox(height: 200),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int id) {
                              if (id == 0) {
                                decide = _isCheck1;
                                text = "box1";
                              } else if (id == 1) {
                                decide = _isCheck2;
                                text = "box2";
                              } else if (id == 2) {
                                decide = _isCheck3;
                                text = "box3";
                              }
                              return menuinfo(
                                  decide,
                                  text,
                                  snapshot.data[id].food_name,
                                  snapshot.data[id].food_nums);
                            });
                      } else {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 250, 0, 180),
                          child: Text(
                            "目前尚無資料",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color(0xFF818181),
                                fontFamily: 'GFSDidot'),
                          ),
                        );
                      }
                    }),
              ),
              GestureDetector(
                onTap: () async {
                  _read("box1");
                  _read("box2");
                  _read("box3");
                  print(_isCheck1);
                  print(_isCheck2);
                  print(_isCheck3);
                  if (_isCheck1 == true) {
                    flag1 = 1;
                  }
                  if (_isCheck2 == true) {
                    flag2 = 1;
                  }
                  if (_isCheck3 == true) {
                    flag3 = 1;
                  }
                  if (flag1 == 1) {
                    count++;
                  }
                  if (flag2 == 1) {
                    count++;
                  }
                  if (flag3 == 1) {
                    count++;
                  }
                  print(count);
                  double cnt = count / 21;
                  print(cnt);
                  _saveCount(cnt);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigation(id),
                    ),
                  );
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text('儲存',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'GFDSidot',
                            color: Color(0XFF818181)))),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.unfold_more,
                      size: 20,
                      color: Colors.grey,
                    ),
                    Text(
                      '上下滑動',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'GFDSidot',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitMenu {
  final int id;
  final String food_name;
  final int food_nums;

  FruitMenu(this.id, this.food_name, this.food_nums);
}