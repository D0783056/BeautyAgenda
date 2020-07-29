import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report/date.dart';
import 'package:report/date_List.dart';
import 'package:report/drawer.dart';
import 'package:report/history_choose.dart';
import 'package:report/bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class History_day extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _History_day(),
    );
  }
}


/// This is the stateless widget that the main application instantiates.
class _History_day extends StatelessWidget {
  String username = '李亞璇';
  int id;
  var year;
  var month;
  var day;
  History_tabs history_tabs = new History_tabs();
  NavDrawerExample navDrawerExample = new NavDrawerExample();

  List<Date> date = [];

  Future _getData() async{
    var gradeurl = 'http://140.134.27.136:5001/get_testdate.php';
    var User_id = {
      'users_id': id,
    };
    String tempdate;
    var res = await http.post(gradeurl, body: json.encode(User_id));
    var history_date = jsonDecode(res.body);
    for (var u in history_date) {
      tempdate = u['nowtime'];
      Date ymd = Date(
          year: tempdate.substring(0 , 4) ,month: tempdate.substring(5,7),day: tempdate.substring(8,10),
          nowtime:tempdate
      );
      date.add(ymd);
    }
    return date;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toptitle().Topbar(context,'檢測歷史',username),
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              child: FutureBuilder<dynamic>(
                future: _getData(),
                builder: (BuildContext context , AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting && snapshot.data == null){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
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
                  } else if(snapshot.data == null){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height:500,
                          child: Center(
                            child: Text(
                              '尚無資料',
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: date.length,
                      itemBuilder: (BuildContext context ,int index){
                        return Testdate(
                          year: date[index].year,
                          month: date[index].month,
                          day: date[index].day,
                          nowtime: date[index].nowtime,
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      drawer: navDrawerExample.drawer(context),
    );
  }

}
