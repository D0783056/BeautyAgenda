import 'package:flutter/material.dart';
import 'choose.dart';

// ignore: must_be_immutable
class Bar extends StatelessWidget {
  int id;
  String imagePath;
  int isFront;

  Bar(int id, String imagePath, int isFront){
    this.id = id;
    this.imagePath = imagePath;
    this.isFront = isFront;
  }
  @override
  Widget build(BuildContext context) {
    Tabs tabs = new Tabs(imagePath, id, isFront);
    Toptitle toptitle = new Toptitle();
    return Scaffold(
      appBar:toptitle.Topbar('膚況報告'),
      body: tabs,
    );
  }
}

class Toptitle {
  PreferredSize Topbar( String titlename){
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xFFFFD0D1),
          leading: IconButton(
            icon: Icon(Icons.person),
            iconSize: 40,
            onPressed: (){

            },
          ),
          title:Center(
            child: Text(
              '$titlename',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'GFSDidot',
              ),
            ),
          ),
          actions: <Widget>[

            IconButton(
              icon: const Icon(Icons.home),
              iconSize: 40,
              onPressed: () {

              },
            ),
          ],
        ),
        preferredSize: Size.fromHeight(60)
    );
  }
}