import 'package:beauty_agenda/BottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'date.dart';
import 'date_List.dart';
import 'drawer.dart';
import 'bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class History_day extends StatelessWidget {
  int id;
  History_day(this.id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _History_day(id),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _History_day extends StatelessWidget {
  _History_day(this.ids);
  int ids;
  var year;
  var month;
  var day;
  String username;

  List<Date> date = [];

  Future _getData() async {
    var gradeurl = 'http://140.134.26.187/BeautyAgenda/get_testdate.php';
    var User_id = {
      'User_id': ids,
    };
    String tempdate;
    var res = await http.post(gradeurl, body: json.encode(User_id));
    var history_date = jsonDecode(res.body);
    for (var u in history_date) {
      tempdate = u['nowtime'];
      Date ymd = Date(
          year: tempdate.substring(0, 4),
          month: tempdate.substring(5, 7),
          day: tempdate.substring(8, 10),
          nowtime: tempdate,
          id: ids);
      date.add(ymd);
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    print("history $ids");
    NavDrawerExample navDrawerExample = new NavDrawerExample(ids);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD0D1),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigation(ids),
              ),
            );
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Center(
          child: Text(
            '檢測歷史',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'GFSDidot',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              child: FutureBuilder<dynamic>(
                future: _getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.data == null) {
                    return Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 250, 0, 10),
                            child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0XFF818181))),
                          ),
                        ),
                        Text(
                          "loading...",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFDSidot',
                              color: Color(0XFF818181)),
                        ),
                        SizedBox(height: 200),
                      ],
                    );
                  } else if (snapshot.data == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 500,
                          child: Center(
                            child: Text(
                              '目前尚無資料',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Color(0xFF818181),
                                  fontFamily: 'GFSDidot'),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: date.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Testdate(
                          year: date[index].year,
                          month: date[index].month,
                          day: date[index].day,
                          nowtime: date[index].nowtime,
                          id: date[index].id,
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
