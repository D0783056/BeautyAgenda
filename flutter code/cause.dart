import 'package:flutter/material.dart';
import 'package:beauty_agenda/week_menu.dart';

class Cause {
  var test;
  Cause(this.test);

  Widget causes1() {
    if (test['black circle'] == true) {
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
  Widget causes2() {
    if(test['acne'] == true) {
      return Column(
        children: <Widget>[
          symptom("痘痘"),
          recommend("熬夜","建議補充維生素A，能幫助皮膚維持營養。"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes3() {
    if(test['wrinkle'] == true) {
      return Column(
        children: <Widget>[
          symptom("皺紋"),
          recommend("皮膚乾燥","建議補充核能酸，使皮膚變得較為豐潤，阻止皺紋的產生，富含核酸的天然食品如魚白雞肝、雞心、牛腎、牛肉、蜜豆、紅豆、豌豆"),
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