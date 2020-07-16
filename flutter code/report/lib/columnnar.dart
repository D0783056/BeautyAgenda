import 'package:flutter/material.dart';



class _Cylinder extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const _Cylinder({Key key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      width: width,
      color: color,
    );
  }
}

class CylinderChart extends StatefulWidget {
  @override
  _CylinderChartState createState() => _CylinderChartState();
}

class _CylinderChartState extends State<CylinderChart> {
  final double _width = 10.0;
  static double week1 = 100 ,week2 = 77 ,week3 = 77 ,week4 = 77 ,week5 = 77 ,week6 = 77 ,week7 = 66;

  List<double> _heightList = [week1 , week2 , week3 , week4 , week5 , week6 , week7];
  List<String> labelList = ['1','2','3','4','5','6','7'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 280,
        width:double.infinity,
        margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color: Color(0XFFFFF5F5),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              left: 10,
              right: 10,
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 0, 20, 30),
                    child :Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(_heightList.length, (index) {
                          return _Cylinder(
                            height: _heightList[index]*2.25,
                            width: _width,
                            color: Color(0XFFFFD0D1),
                          );
                        }
                        )

                    ),
              )
            ),
            Positioned.fill(
                left: 10,
                right: 10,
                child: Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 20, 10),
                  child :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(_heightList.length, (index) {
                        return Text(
                          '${labelList[index]}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        );
                      }
                      )

                  ),
                )
            ),
            Positioned.fill(child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.fromLTRB(10, 100, 10, 30),
                      color: Color(0XFFD1CDCD),
                      child: SizedBox(
                        width: 300,
                        height:2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                      color: Color(0XFFD1CDCD),
                      child: SizedBox(
                        width: 300,
                        height: 2,
                      ),
                    )
                  ],
                )
              ],
            )),
            Positioned.fill(child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                      child: Text(
                        '重度',
                        style: TextStyle(
                          color: Color(0XFF818181),
                          fontSize: 15,
                          fontFamily: 'GFDSisiot',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Text(
                        '中度',
                        style: TextStyle(
                          color: Color(0XFF818181),
                          fontSize: 15,
                          fontFamily: 'GFDSisiot',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: Text(
                        '輕度',
                        style: TextStyle(
                          color: Color(0XFF818181),
                          fontSize: 15,
                          fontFamily: 'GFDSisiot',
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}