import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class habit_problem {
  var body;

  Widget Body(){
    if(body == "A"){
      return Column(
        children: <Widget>[
          habitText('你經常食用甜食！'),
          habitText('時常熬夜齁！'),
          habitText('三餐不正常吃不好喔！'),
          habitText('經常吃宵夜對不對！'),
        ],
      );
    } else if(body == 'B'){
      return Column(
        children: <Widget>[
          habitText('臉部清潔太過度啦！'),
          habitText('油炸食物吃太多囉！'),
          habitText('太陽很大，怎麼還一直待在外面'),
        ],
      );
    } else if(body == 'C'){
      return Column(
        children: <Widget>[
          habitText('時常熬夜喔！'),
          habitText('太陽很大，怎麼還一直待在外面'),
          habitText('經常揉眼睛不好喔！'),
        ],
      );
    } else {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(45, 10, 35, 0),
              child: Text(
                '你的生活習慣非常優良，要繼續保持喔！',
                style: TextStyle(
                  fontSize: 20,//TODO 改大小
                  fontFamily: 'GFDSidot',
                  color: Color(0XFF818181),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(45, 30, 35, 0),
              child: Row(
                  children: [
                    Icon(Icons.favorite_border,
                    color: Color(0XFF818181),
                    size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                    Icon(Icons.favorite_border,
                      color: Color(0XFF818181),
                      size: 30,),
                  ],
                ),
              ),
          ],
        ),
      );
    }
  }


  Widget suggest_print(){
    if(body == 'A'){
      return Suggest('甜食雖然可以有效降低心靈上的壓力，但為了你的肌膚著想，還是要少吃喔！因為血液中的糖會附著在蛋白質上，並產生危害分子——糖化終產物AGEs'
          '熬夜以及不正常時間的飲食也會導致新陳代謝不良'
          '這些都會造成你的皮膚嚴重老化的！');
    } else if(body == 'B'){
      return Suggest('雖然清潔很重要，但切記，過度清潔會導致你的角質層被破壞喔！另外，若需要長時間處在陽光底下，要記得經常補充水分以及塗抹防曬，'
          '才不會讓你出油量持續增加。');
    } else if(body == 'C'){
      return Suggest('剛睡醒的時候很想揉眼睛吧？但經常性揉眼睛，會容易造成你的眼角皮膚會造成你的皮膚鬆弛。另外眼部四周的肌膚水份非常容易蒸發,保水能力又不佳'
          '建議水分還是要多補充喔！');
    }
    else {
      return Suggest('你做得非常好！ 改善皮膚的第一步就是從生活作息開始。接下來要記得照著菜單走喔！');

    }
  }
}


Widget habitText(String habit) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(45, 10, 0, 0),
            child: Icon(
              Icons.fiber_manual_record,
              size: 10,//TODO 改大小
              color: Color(0XFF818181),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 30, 0),
            child: Text(
              '$habit',
              style: TextStyle(
                fontSize: 20,//TODO 改大小
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget Suggest(String suggest){
  return Container(
    width: 290,
    height: 300,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: new Border.all(color: Color(0XFF818181), width: 1.5), // 边色与边宽度
      borderRadius: BorderRadius.all(Radius.circular(16.0)),

    ),
    margin: EdgeInsets.fromLTRB(0, 40, 0, 10),

    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.lightbulb_outline,
                color: Color(0XFF818181),
                size: 19,
              ),
              Text(
                '貼心提醒',
                style: TextStyle(
                  color: Color(0XFF818181),
                  fontSize: 19,
                  fontFamily: 'GFDSidiot',
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 5, 20, 25),
          child: Text(
            '$suggest',
            style: TextStyle(
              color: Color(0XFF818181),
              fontSize: 18,
              fontFamily: 'GFDSidiot',
            ),
          ),
        ),
      ],
    ),
  );
}