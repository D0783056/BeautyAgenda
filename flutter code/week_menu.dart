import 'package:flutter/material.dart';

class WeekmenuPage extends StatefulWidget {
  @override
  _WeekmenuPageState createState() => _WeekmenuPageState();
}

class _WeekmenuPageState extends State<WeekmenuPage> {
  Label label = new Label();
  Degree complete = new Degree();
  Image faceImage = null;
  int grade = 10;
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  String problem1 = "黑眼圈";

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
                child: Column(
                  children: <Widget>[
                    label.item('維生素A', 10000, Color(0xFFFFD0D1)),
                    label.item('維生素B', 10000, Colors.white),
                    label.item('維生素C', 10000, Color(0xFFFFD0D1)),
                    label.item('維生素D', 10000, Colors.white),
                    label.item('維生素E', 10000, Color(0xFFFFD0D1)),
                  ],
                ),
              ),
              label.label('實際攝取量'),

              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                decoration: BoxDecoration(
                    color: Color(0XFFF0EFEF),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Card(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(Color(0XFFB2AFAF)),
                        value: complete.getDegree(),
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

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    label.item('維生素A', 10000, Color(0xFFFFD0D1)),
                    label.item('維生素B', 10000, Colors.white),
                    label.item('維生素C', 10000, Color(0xFFFFD0D1)),
                    label.item('維生素D', 10000, Colors.white),
                    label.item('維生素E', 10000, Color(0xFFFFD0D1)),
                  ],
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
  double degree = 0;

  double getDegree() {
    this.degree = 0;
    this.degree = this.degree + 0.1;
    return degree;
  }
}