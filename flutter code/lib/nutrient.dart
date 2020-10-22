import 'package:flutter/material.dart';

class Nutrient {
  String fruit;
  Nutrient(this.fruit);

  // ignore: missing_return
  Widget elements() {
    if (fruit == "香蕉") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素A"),
        contents("增進皮膚與黏膜的健康、幫助牙齒和骨骼的發育與生長"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
      ]);
    } else if (fruit == "葡萄") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素A"),
        contents("增進皮膚與黏膜的健康、幫助牙齒和骨骼的發育與生長"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素D"),
        contents("有促進鈣質吸收、預防骨鬆的作用、以及調解免疫功能、避免慢性發炎"),
      ]);
    } else if (fruit == "橘子") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("β-胡蘿蔔素"),
        contents("避免皮膚多屑、角質化、延緩衰老"),
      ]);
    } else if (fruit == "鮭魚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("鋅"),
        contents("幫助治療痤瘡、減少發炎、抗老化"),
      ]);
    } else if (fruit == "大骨湯") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("鋅"),
        contents("幫助治療痤瘡、減少發炎、抗老化"),
      ]);
    } else if (fruit == "柳丁") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("β-胡蘿蔔素"),
        contents("避免皮膚多屑、角質化、延緩衰老"),
      ]);
    } else if (fruit == "柚子") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
      ]);
    } else if (fruit == "檸檬") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
      ]);
    } else if (fruit == "葡萄柚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
      ]);
    } else if (fruit == "番茄") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素A"),
        contents("增進皮膚與黏膜的健康、幫助牙齒和骨骼的發育與生長"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素B"),
        contents("促進及支持紅血球生長、視力、腦部與神經功能"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("茄紅素"),
        contents("抗氧化、美白、抗皺"),
      ]);
    } else if (fruit == "紅蘿蔔") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("β-胡蘿蔔素"),
        contents("增進皮膚與黏膜的健康、幫助牙齒和骨骼的發育與生長"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素A"),
        contents("抗氧化、美白、抗皺"),
      ]);
    } else if (fruit == "花椰菜") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("β-胡蘿蔔素"),
        contents("避免皮膚多屑、角質化、延緩衰老"),
      ]);
    } else if (fruit == "地瓜") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("β-胡蘿蔔素"),
        contents("避免皮膚多屑、角質化、延緩衰老"),
      ]);
    } else if (fruit == "綠茶") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("兒茶素"),
        contents("抗氧化、 抗老化及美白肌膚、減重瘦身"),
      ]);
    } else if (fruit == "藍莓") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("花青素"),
        contents("抗發炎、抗癌、增強心血管彈性"),
      ]);
    } else if (fruit == "蔓越莓") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("花青素"),
        contents("抗發炎、抗癌、增強心血管彈性"),
      ]);
    } else if (fruit == "沙丁魚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("ω-3脂肪酸"),
        contents("維持心情開朗、降血壓、抗發炎"),
      ]);
    } else if (fruit == "秋刀魚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("ω-3脂肪酸"),
        contents("維持心情開朗、降血壓、抗發炎"),
      ]);
    } else if (fruit == "鮭魚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("ω-3脂肪酸"),
        contents("維持心情開朗、降血壓、抗發炎"),
      ]);
    } else if (fruit == "鮪魚") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("ω-3脂肪酸"),
        contents("維持心情開朗、降血壓、抗發炎"),
      ]);
    } else if (fruit == "牛奶") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("菸鹼酸"),
        contents("增生皮膚屏障，達到保濕效果、改善粉刺、痘痘生成並有助縮小毛孔"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素B"),
        contents("促進及支持紅血球生長、視力、腦部與神經功能、食慾與消化機能"),
      ]);
    } else if (fruit == "玉米") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素B"),
        contents("促進及支持紅血球生長、視力、腦部與神經功能、食慾與消化機能"),
      ]);
    } else if (fruit == "檸檬") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("檸檬酸"),
        contents("增強食慾和促進體內鈣、磷物質的消化吸收"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素B"),
        contents("促進及支持紅血球生長、視力、腦部與神經功能、食慾與消化機能"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("果酸"),
        contents("去除皮膚老化角質細胞、補濕及加強彈性、促進皮膚新生"),
      ]);
    } else if (fruit == "燕麥") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("鐵"),
        contents("補血功效、使身體健康及有紅潤臉色"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("維生素E"),
        contents("抗氧化、增強免疫系統、抗凝血、抗老化"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("鋅"),
        contents("幫助治療痤瘡、減少發炎、抗老化"),
      ]);
    } else if (fruit == "銀耳") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("鈣"),
        contents("維持骨骼與牙齒正常發育及健康、穩定神經，幫助入睡"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("鉀"),
        contents("維持神經健康、心跳規律正常，可以預防中風"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("銀耳多醣體"),
        contents("提高皮膚含水率，降低皮膚水分散失量"),
      ]);
    } else if (fruit == "魚翅") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("軟骨素"),
        contents("把重要的氧供和營養素輸送至關節，幫助清除關節內的廢物"),
      ]);
    } else if (fruit == "蘋果") {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        titles("維生素C"),
        contents("抗氧化、能促進膠原蛋白合成、維持心血管健康"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("茄紅素"),
        contents("抗氧化、美白、抗皺"),
        Container(
          margin: EdgeInsets.only(top:10.0, bottom: 10.0),
          height: 2,
          color: Colors.grey[500],
        ),
        titles("山茶酚"),
        contents("抗脂質過氧化，預防衰老、人體易消化吸收"),
      ]);
    }
  }
}

Widget titles(String element) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.0),
    child: Text(element,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'GFSDidot',
          fontSize: 22.0,
          color: const Color(0xFF818181),
        )),
  );
}

Widget contents(String element) {
  return Text(element,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'GFSDidot',
        fontSize: 20.0,
        color: const Color(0xFF818181),
      ));
}