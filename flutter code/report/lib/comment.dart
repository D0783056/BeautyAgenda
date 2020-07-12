import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(100, 20, 100, 40),

              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(''),
              ),
            ),

            Card(
                margin: EdgeInsets.fromLTRB(50,0,0,10),

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
                    )
                )
            ),

            Card(
                margin: EdgeInsets.fromLTRB(50,0,50,10),
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    height: 300,
                    width: double.maxFinite,
                    child: Column(
                      children: <Widget>[
                        Text(//TODO 顯示排版
                          "$how",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF818181)
                          ),
                        ),
                        Container(
                          child :Row(
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
                                      color: Color(0XFF818181)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),


            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}