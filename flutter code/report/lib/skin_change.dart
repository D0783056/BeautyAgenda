import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:report/columnnar.dart';

class Skin_change extends StatefulWidget {
  @override
  _Skin_changeState createState() => _Skin_changeState();
}

class _Skin_changeState extends State<Skin_change> {
  String _year;
  int _sales;
  CylinderChart cylinderChart = new CylinderChart();
  //點擊柱狀圖觸發的函數
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    print(selectedDatum.first.datum.year);
    print(selectedDatum.first.datum.sales);
    print(selectedDatum.first.series.displayName);
    setState(() {
      //改變兩個顯示的數值
      _year = selectedDatum.first.datum.year;
      _sales = selectedDatum.first.datum.sales;
    });
  }


  //TODO 狀況變數尚未決定
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: new Border.all(color: Color(0XFF818181), width: 1.5), // 边色与边宽度
                ),
                margin: EdgeInsets.fromLTRB(30, 40, 30, 20),

                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.lightbulb_outline,
                            color: Color(0XFF818181),
                            size: 30,
                          ),
                          Text(
                            '小提示',
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
                      margin: EdgeInsets.fromLTRB(25, 10, 20, 25),
                      child: Text(
                        '這裡會分析你這7天的臉部皮膚瑕疵數目的變化，做出程度區分，以利對作息及飲食的修正和分析。',
                        style: TextStyle(
                          color: Color(0XFF818181),
                          fontSize: 19,
                          fontFamily: 'GFDSidiot',
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 2,
                    width: double.infinity,
                  )
              ),

              Container(
                margin: EdgeInsets.only(top: 60),
                child: cylinderChart,
              )
            ],
          ),
        ),
      ),
    );
  }
}
