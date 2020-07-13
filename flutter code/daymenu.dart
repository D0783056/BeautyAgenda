import 'package:flutter/material.dart';
import 'week_menu.dart';

class DaymenuPage extends StatefulWidget {
  @override
  _DaymenuPageState createState() => _DaymenuPageState();
}

class _DaymenuPageState extends State<DaymenuPage> {
  var nowTime = new DateTime.now(); //获取当前时间
  Label label = new Label();
  Degree complete = new Degree();
  bool _isCheck;

  @override
  void initState() {
    super.initState();
    _isCheck = false;
  }

  Widget _checkbox (String foodname, String foodamount, String images){
    return Container(
      child: Checkbox(
        tristate: false,
        value: _isCheck,
        onChanged: (isCheck){
          setState(() {
            _isCheck = isCheck;
          });
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(// 主頁面
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              label.label('${nowTime.year} / ${nowTime.month} / ${nowTime.day}'),
              _checkbox('1', '1', '1'),
              _checkbox('1', '1', '1'),
              _checkbox('1', '1', '1'),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.unfold_more,
                      size: 20,
                      color: Colors.grey,
                    ),
                    Text(
                      '上下滑動',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'GFDSidot',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Nutrient{// 顯示框的資料
  Container nutruentList(String nutrient, String effect, Color color) {
    return Container(
        width: double.infinity,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: 15,
                    color: Color(0XFF818181),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '$nutrient',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GFDSidot',
                      color: Color(0XFF818181),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                '$effect',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'GFDSidot',
                  color: Color(0XFF818181),
                ),
              ),
            )
          ],
        ));
  }
}