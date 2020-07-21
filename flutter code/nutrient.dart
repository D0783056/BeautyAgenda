import 'package:flutter/material.dart';

class Nutrient {
  // 顯示框的資料
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