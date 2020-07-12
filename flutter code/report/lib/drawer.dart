import 'package:flutter/material.dart';
import 'package:report/history_bar.dart';
import 'package:report/history_day.dart';
import 'package:report/skin.dart';

class NavDrawerExample extends StatelessWidget {
  String username = '李亞璇';
  @override

  Widget build(context) {
    return  Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
                Icons.person,
                size: 40,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations
                .of(context)
                .openAppDrawerTooltip,
          );
        },
      );
  }

  Container list (IconData icon , String listname){
    return Container(
      margin: EdgeInsets.fromLTRB(60, 10, 50, 10),
      height: 60,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '$listname',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget drawer(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                    backgroundColor: Color(0XFFFFD0D1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '$username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(color: Color(0XFFFAE2E3)),
          ),
          Container(
            color: Color(0XFFFFD0D1),
            child: Column(
              children: <Widget>[

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History_day()),
                    );
                  },
                  child: list(Icons.event_note, '檢測歷史'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Skin()),
                    );
                  },
                  child: list(Icons.insert_chart, '膚況變化'),
                ),
                Container(
                  height: 1,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 90, 0),
                          child: Text(
                            "Beauty",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(90, 10, 0, 30),
                          child: Text(
                            "Agenda",
                            textAlign: TextAlign.right,
                            style: new TextStyle(
                              fontFamily: 'GFSDidot',
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}

