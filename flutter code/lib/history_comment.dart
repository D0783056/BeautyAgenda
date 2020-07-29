import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:report/week_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryComment extends StatefulWidget {
  @override
  _HistoryCommentState createState() => _HistoryCommentState();
}

class _HistoryCommentState extends State<HistoryComment> {
  Label label = new Label();
  String img;
  Uint8List img2;
  int grade;
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  int id;
  String nowtime;
  List<String> diseaselist = [];

  _readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      id = value;
    });
  }
  _readnowtime() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'nowtime';
    final value = prefs.getString(key) ?? null;
    setState(() {
      nowtime = value;
    });
  }

  Future _getJudgeresult() async {
    var gradeurl = 'http://140.134.27.136:5001/get_Judge_result.php';
    var User = {
      'Users_id': id,
      'nowtime' : nowtime,
    };
    diseaselist = [];
    var res = await http.post(gradeurl, body: json.encode(User));
    var data = jsonDecode(res.body);

    for(var u in data){
      grade = int.parse(u['grades']);
      img = Base64Decoder().convert(u['base64']).toString();
      img2 = Base64Decoder().convert(u['base64']);
      diseaselist=[];
      if(int.parse(u['forehead'] )== 1){
        diseaselist.add('抬頭紋');
      }
      if(int.parse(u['chuan']) == 1){
        diseaselist.add('川字紋');
      }
      if(int.parse(u['crow']) == 1){
        diseaselist.add('魚尾紋');
      }
      if(int.parse(u['smile_line']) == 1){
        diseaselist.add('法令紋');
      }
      if(int.parse(u['dark_circle']) == 1){
        diseaselist.add('黑眼圈');
      }
      if(int.parse(u['acne']) == 1){
        diseaselist.add('痘痘');
      }
      if(int.parse(u['freckle']) == 1){
        diseaselist.add('雀斑');
      }
    }

  }

  //TODO 狀況變數尚未決定
  @override
  void initState() {
    _readId();
    _readnowtime();
    super.initState();
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder<dynamic>(
              future: _getJudgeresult(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting && snapshot.data == null){
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 250, 0, 10),
                        child: CircularProgressIndicator(),
                      ),
                      Text(
                        "loading...",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'GFDSidot',
                            color: Color(0XFF818181)),
                      ),
                      SizedBox(height: 200),
                    ],
                  );
                }
                else{
                  return Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        label.label(
                            '${nowtime.substring(0,4)} / ${nowtime.substring(5,7)} / ${nowtime.substring(8,10)}'),
                        Card(
                          margin: EdgeInsets.fromLTRB(100, 20, 100, 40),

                          child: Container(
                            width: 200,
                            height: 250,
                            child: Image.memory(
                              img2,
                              fit: BoxFit.fill,
                            )//TODO 圖片路徑
                          ),
                        ),

                        Card(
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
                                )
                            )
                        ),

                        Card(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                height: 300,
                                width: double.maxFinite,
                                child: Column(
                                  children: <Widget>[
                                    Text( //TODO 顯示排版
                                      "$how",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0XFF818181)
                                      ),
                                    ),//TODO 症狀
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: diseaselist.length,
                                      itemBuilder: (BuildContext context , int index){
                                        return ResultDisease(
                                          disease: diseaselist[index],
                                        );
                                      },
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
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ResultDisease extends StatelessWidget{
  final String disease;
  ResultDisease({this.disease});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  10, 0, 0, 0),
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
                '$disease',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GFDSidot',
                    color: Color(0XFF818181)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
