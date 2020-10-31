import 'package:flutter/material.dart';
import 'week_menu.dart';

class Cause {
  var test;
  Cause(this.test);

  Widget causes1() {
      return Column(
        children: <Widget>[
          symptom("痘痘"),
          recommend("皮膚油脂過多", "建議多補充維生素B2(芝麻、核桃、松子、腰果、開心果、鰻魚、鯖魚、鮭魚)、泛酸(玉米、豌豆、花生)、菸鹼酸(無花果、花生、芝麻、綠豆)、維他命A(綠色花椰菜、胡蘿蔔，南瓜、哈密瓜、芒果、木瓜)、β-胡蘿蔔素(胡蘿蔔)"),
          recommend("角質代謝異常", "建議多補充維他命A")
        ],
      );
    }
  Widget causes2() {
    if(test['freckle'] == true) {
      return Column(
        children: <Widget>[
          symptom("雀斑"),
          recommend("黑色素在表皮分佈不均","建議多補充維生素C(青椒、橘子、芭樂、番茄、奇異果)、維生素E(芝麻、杏仁、核桃、南瓜)、多酚類(藍莓、紅葡萄、茄子、黃豆、黑咖啡、綠茶、薑黃)、膠原蛋白(腳蹄、雞翅、雞皮)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes3() {
    if(test['chuan'] == true) {
      return Column(
        children: <Widget>[
          symptom("川字紋"),
          recommend("硫酸軟骨素攝取不足，皮膚失去彈性","建議多補充軟骨素(雞皮、魚刺)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes4() {
    if(test['crow'] == true) {
      return Column(
        children: <Widget>[
          symptom("魚尾紋"),
          recommend("身體自行合成核酸能力衰退","建議多補充核酸(鰻魚、鯖魚、鮭魚、泰國蝦、木耳、蘑菇)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes5() {
    if(test['smile_line'] == true) {
      return Column(
        children: <Widget>[
          symptom("法令紋"),
          recommend("膠原蛋白流失","建議多補充膠原蛋白、維生素C、鋅(鮭魚、南瓜)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes6() {
    if(test['forehead'] == true) {
      return Column(
        children: <Widget>[
          symptom("抬頭紋"),
          recommend("皮膚水分流失","建議多補充維生素A、維生素E(幫助鎖水、防止皮膚下的脂肪氧化，增強皮膚表皮和真皮細胞的活力、預防色素沈澱)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes7() {
    if(test['dark_circle'] == true) {
      return Column(
        children: <Widget>[
          symptom("黑眼圈"),
          recommend("過度曝曬", "建議你做好防曬，外出可以撐陽傘，補充一些抗曬的營養素，如茄紅素可以美白、β胡蘿蔔素可以消除黑色素。"),
          recommend("發炎", "你的體內可能再發炎呦!，建議你保持充足的睡眠，補充一些抗發炎的營養素，富含植化素以及Omega-3脂肪酸都是很好的抗發炎營養素。")
        ],
      );
    } else {
      return Container(
      );
    }
  }
}

Widget symptom(String sname) {
  Label label = new Label();
  return Column(
    children: <Widget>[
      label.label(sname),
      Container(
        margin: EdgeInsets.fromLTRB(45, 20, 30, 0),
        child: Text(
          '你有$sname喔!\n經過影像的判斷和你的作息做比對後，發現你發現可能的成因有下列幾點:',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'GFDSidot',
            color: Color(0XFF818181),
          ),
        ),
      ),
    ],
  );
}
Widget recommend(String cause,String recommend) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Icon(
              Icons.fiber_manual_record,
              size: 15,
              color: Color(0XFF818181),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: Text(
              '$cause',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.fromLTRB(45, 10, 30, 0),
        child: Text(
          '$recommend',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'GFDSidot',
            color: Color(0XFF818181),
          ),
        ),
      ),
    ],
  );
}