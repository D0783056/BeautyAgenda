import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'week_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;


// ignore: must_be_immutable
class HistoryComment extends StatefulWidget {
  int id;
  HistoryComment(this.id);
  @override
  _HistoryCommentState createState() => _HistoryCommentState(id);
}

class _HistoryCommentState extends State<HistoryComment> {
  int id;
  _HistoryCommentState(this.id);
  Label label = new Label();
  String img2;
  int grade;
  String how = "你今天真好看!\n但是你可能有一些小問題喔!";
  String nowtime;
  List<String> diseaselist = [];
  int change = 0;
  Uint8List img3;

  Widget displayImg(String base64, int isFront) {
    double mirror;
    if (isFront == 1) {
      mirror = math.pi;
    } else {
      mirror = 0;
    }
    img3 = Base64Decoder().convert(base64);
    return Transform(
      alignment: Alignment.center,
      child: Image.memory(img3,height:240.0,width: 200, fit: BoxFit.fill),
      transform: Matrix4.rotationY(mirror),
    );
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
    var gradeurl = 'http://140.134.26.187/BeautyAgenda/get_Judge_result.php';
    var User = {
      'User_id': id,
      'nowtime' : nowtime,
    };
    diseaselist = [];
    var res = await http.post(gradeurl, body: json.encode(User));
    var data = jsonDecode(res.body);

    for(var u in data){
      grade = int.parse(u['grades']);
      img2 = u['base64'];
      change = int.parse(u['isfront']);
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
                if(snapshot.connectionState == ConnectionState.waiting && snapshot.data == null) {
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
                } else {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        label.label('${nowtime.substring(0,4)} / ${nowtime.substring(5,7)} / ${nowtime.substring(8,10)}'),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey , width: 2),
                          ),
                          margin: EdgeInsets.fromLTRB(110, 20, 100, 40),
                          child: displayImg(img2,change),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 0, 10),

                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: Colors.grey , width: 2),
                                ),
                                height: 50,
                                width: 95,
                                child: Center(
                                  child: Text(
                                    '$grade分',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                            )
                        ),

                        Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: Colors.grey , width: 2),
                                ),
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
              margin: EdgeInsets.only(left: 10),
              height: 10,
              width: 10,
              color: Color(0xFFFFD0D1),
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
