import 'package:flutter/material.dart';
import 'week_menu.dart';
import 'package:health/health.dart';

class History_Cause {
  var test;
  History_Cause(this.test);

  Widget causes1() {
    if (int.parse(test['acne']) == 1) {
      return Column(
        children: <Widget>[
          symptom("痘痘"),
          recommend("皮膚油脂過多", "建議你盡量少吃油炸食物，多補充維生素A、維生素E，以幫助鎖水，避免臉部因為缺乏水分而導致出油量增加"),
          recommend("新陳代謝不佳", "不要經常熬夜或晚睡喔！建議你在11點以前睡覺喔～"),
          recommend("角質代謝異常", "建議選擇洗面乳時，痘痘肌可以選擇溫和的潔淨成分才不會過度刺激肌膚，像以胺基酸界面活性劑為基底的洗面乳，維持角質層和皮質膜正常運作，呵護脆弱的痘痘肌")
        ],
      );
    }
    else {
      return Container(
      );
    }
  }
  Widget causes2() {
    if(int.parse(test['freckle']) == 1) {
      return Column(
        children: <Widget>[
          symptom("雀斑"),
          recommend("黑色素在表皮分佈不均","建議多補充維生素Ｃ及多酚類幫助淡化黑色素，並且防曬要充足，才能避免黑色素沈澱"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes3() {
    if(int.parse(test['chuan']) == 1) {
      return Column(
        children: <Widget>[
          symptom("川字紋"),
          recommend("硫酸軟骨素不足，皮膚失去彈性","建議多補充軟骨素(雞皮、魚刺)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes4() {
    if(int.parse(test['crow']) == 1) {
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
    if(int.parse(test['smile_line']) == 1) {
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
    if(int.parse(test['forehead']) == 1) {
      return Column(
        children: <Widget>[
          symptom("抬頭紋"),
          recommend("皮膚水分流失","建議多補充維生素A、維生素E，以幫助鎖水、防止皮膚下的脂肪氧化。另外也盡量減少日曬，避免肌膚乾燥造成光老化。)"),
        ],
      );
    } else {
      return Container(
      );
    }
  }
  Widget causes7() {
    if(int.parse(test['dark_circle']) == 1) {
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
      label.causelabel(sname),
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
              '$cause',
              style: TextStyle(
                fontSize: 20,//TODO 改大小
                fontFamily: 'GFDSidot',
                color: Color(0XFF818181),
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.fromLTRB(60, 10, 30, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$recommend',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'GFDSidot',
              color: Color(0XFF818181),
            ),
          ),
        ),
      ),
    ],
  );
}