import 'package:flutter/material.dart';
import 'week_menu.dart';
import 'package:provider/provider.dart';

class DaymenuPage extends StatefulWidget {
  @override
  _DaymenuPageState createState() => _DaymenuPageState();
}

class _DaymenuPageState extends State<DaymenuPage> {
  var nowTime = new DateTime.now(); //获取当前时间
  Label label = new Label();
  Degree complete = new Degree();
  Nutrient nutrient = new Nutrient();

  String nutrientname = '維生素C';
  String nutrienteffct = '抗氧化、美白、抗皺';
  String foodimage1 = 'images/番茄.jpg';
  String foodimage2 = 'images/橘子.jpg';
  String foodimage3 = 'images/藍莓.jpg';

  String foodname1 = '番茄';
  String foodname2 = '橘子';
  String foodname3 = '藍莓';
  String foodamount1 = '5';
  String foodamount2 = '1/2';
  String foodamount3 = '6';

  bool op1 = false;
  bool op2 = false;
  bool op3 = false;

  void change(bool op){
    if(op == false){
      Provider.of<newDegree>(context).subprogress();
    }
    else if(op == true) {
      Provider.of<newDegree>(context).addprogress();
    }
  }


  //TODO 狀況變數尚未決定
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(// 主頁面
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            label.label('${nowTime.year} / ${nowTime.month} / ${nowTime.day}'),

            Container(//第一個checkbox
              color: Colors.white,
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(18, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Checkbox(
                          value: op1,
                          onChanged: (bool value) {
                            setState(() {
                              op1 = value;
                              change(op1);
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '$foodname1  $foodamount1份',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'GFDSidiot',
                            color: Color(0XFF818181),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    child: AspectRatio(
                      aspectRatio: 3 / 1, // 宽高比
                      child: Image.asset(
                        '$foodimage1',
                        fit: BoxFit.fill,
                      ),
                    ),
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content:Container(
                            height: 180,
                            width: 80,
                            child: Column(
                              children: <Widget>[
                                nutrient.nutruentList(nutrientname, nutrienteffct,Color((0xFFFFD0D1) ),
                                )],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context, '關閉'),
                            ),
                          ],
                        ),
                      );
                    }),
              ]),
            ),

            //
            Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(18, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Checkbox(
                          onChanged: (bool value){
                            setState(()=> value);
                            op2 = value;
                            change(op2);
                          },
                          value: op2,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '$foodname2  $foodamount2份',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'GFDSidiot',
                            color: Color(0XFF818181),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    child: AspectRatio(
                      aspectRatio: 3 / 1, // 宽高比
                      child: Image.asset(
                        '$foodimage2',
                        fit: BoxFit.fill,
                      ),
                    ),
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content:Container(
                            height: 180,
                            width: 80,
                            child: Column(
                              children: <Widget>[
                                nutrient.nutruentList('$nutrientname','$nutrienteffct', Color(0xFFFFD0D1)),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context, '關閉'),
                            ),
                          ],
                        ),
                      );
                    }),
              ]),
            ),

            //
            Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(18, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Checkbox(
                          value: op3,
                          onChanged: (bool value){
                            setState((){
                              op3 = value;
                              change(op3);
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '$foodname3  $foodamount3份',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'GFDSidiot',
                            color: Color(0XFF818181),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    child: AspectRatio(
                      aspectRatio: 3 / 1, // 宽高比
                      child: Image.asset(
                        '$foodimage3',
                        fit: BoxFit.fill,
                      ),
                    ),
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0,0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          content:Container(
                            height: 180,
                            width: 50,
                            child: Column(
                              children: <Widget>[
                                nutrient.nutruentList('$nutrientname','$nutrienteffct', Color(0xFFFFD0D1)),
                                nutrient.nutruentList('$nutrientname','$nutrienteffct', Colors.grey[200]),
                                nutrient.nutruentList('$nutrientname','$nutrienteffct', Color(0xFFFFD0D1)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ]),
            ),
            //-------------
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
    );
  }
}



class Nutrient{// 顯示框的資料
  Container nutruentList(String nutrient, String effect, Color color) {
    return Container(
        color: color,
        height: 60,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
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
                    '$nutrient',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GFDSidot',
                      color: Color(0XFF818181),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                '$effect',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'GFDSidot',
                  color: Color(0XFF818181),
                ),
              ),
            )
          ],
        ));
  }
}


