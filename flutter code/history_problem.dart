import 'package:flutter/material.dart';
import 'history_Cause.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable, camel_case_types
class History_problem extends StatefulWidget {
  int id;
  History_problem(this.id);

  @override
  _History_problemState createState() => _History_problemState(id);
}

class _History_problemState extends State<History_problem> {
  int id;
  String nowtime;
  var u;
  var problem;
  History_Cause object;
  _History_problemState(this.id);

  _readnowtime() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'nowtime';
    final value = prefs.getString(key) ?? null;
    setState(() {
      nowtime = value;
    });
  }

  Future getproblem() async {

    var gradeurl = 'https://beautyagenda.000webhostapp.com/get_problem.php';
    var User = {
      'User_id': id,
      'nowtime' : nowtime,
    };
    var res = await http.post(gradeurl, body: json.encode(User));
    var data = jsonDecode(res.body);

    for(u in data){
      problem = u;
    }
    object = History_Cause(problem);

  }
  @override
  void initState() {
    _readnowtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder<dynamic>(
              future: getproblem(),
              builder: (BuildContext context , AsyncSnapshot snapshpt){
                if(snapshpt.connectionState == ConnectionState.waiting && snapshpt.data == null){
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
                }
                else{
                  return Container(
                    child: Column(
                      children: <Widget>[
                        object.causes1(),
                        object.causes2(),
                        object.causes3(),
                        object.causes4(),
                        object.causes5(),
                        object.causes6(),
                        object.causes7(),
                        SizedBox(height:30.0),
                        Row(//TODO 置底
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
                                fontSize: 20,
                                fontFamily:'GFDSidot',
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
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