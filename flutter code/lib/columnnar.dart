import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class _Cylinder extends StatelessWidget {
  final double height;

  const _Cylinder({Key key, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      width: 10.0,
      color: Color(0XFFFFD0D1),
    );
  }
}

class CylinderChart extends StatefulWidget {
  @override
  _CylinderChartState createState() => _CylinderChartState();
}

class _CylinderChartState extends State<CylinderChart> {
  var id = 19;


  List<double> _heightList = [];
  List<String> labelList = ['1','2','3','4','5','6','7'];

  _readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      id = value;
    });
  }
  Future getData() async{
    var gradeurl = 'http://140.134.27.136:5001/grade.php';
    var User_id = {
      'users_id': id,
    };

    var res = await http.post(gradeurl, body: json.encode(User_id));
    var data = jsonDecode(res.body);
    for(var u in data) {
      _heightList.add(double.parse(u['grades']));
    }
    while(_heightList.length <= 7){
      _heightList.add(0);
    }
      //前7次的分數
      return _heightList;

  }

  @override
  void initState(){
    _readId();
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder<dynamic>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Container(
                      height: 280,
                      width:double.infinity,
                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20),
                        color: Color(0XFFFFF5F5),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              left: 10,
                              right: 10,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(40, 0, 20, 30),
                                child :Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:List.generate(7, (index) {
                                      return _Cylinder(
                                        height: _heightList[index]*2.25,
                                      );
                                      }
                                    ),
                                ),
                              )
                          ),
                          Positioned.fill(
                              left: 10,
                              right: 10,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(40, 0, 20, 10),
                                child :Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: List.generate(7, (index) {
                                      return Text(
                                        '${labelList[index]}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      );
                                    }
                                    )

                                ),
                              )
                          ),
                          Positioned.fill(child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[

                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 100, 10, 30),
                                    color: Color(0XFFD1CDCD),
                                    child: SizedBox(
                                      width: 300,
                                      height:2,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                                    color: Color(0XFFD1CDCD),
                                    child: SizedBox(
                                      width: 300,
                                      height: 2,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                          Positioned.fill(child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[

                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                                    child: Text(
                                      '重度',
                                      style: TextStyle(
                                        color: Color(0XFF818181),
                                        fontSize: 15,
                                        fontFamily: 'GFDSisiot',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                                    child: Text(
                                      '中度',
                                      style: TextStyle(
                                        color: Color(0XFF818181),
                                        fontSize: 15,
                                        fontFamily: 'GFDSisiot',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 30, 10, 15),
                                    child: Text(
                                      '輕度',
                                      style: TextStyle(
                                        color: Color(0XFF818181),
                                        fontSize: 15,
                                        fontFamily: 'GFDSisiot',
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
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
              },
            ),
          ),
        ],
      ),
    );
  }

}