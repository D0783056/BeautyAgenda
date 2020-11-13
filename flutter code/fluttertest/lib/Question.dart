import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  final String name;
  final Function onSelected;
  final double alignText;
  List<String> checked = [];
  Question({@required this.name, this.checked, this.onSelected, this.alignText});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
          child: Column(children: <Widget>[
            Container(
              margin:  EdgeInsets.fromLTRB(0, 10, alignText, 10),
              child: Text(name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'GFSDidot',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF818181),
                      fontSize: 26)),
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            CheckboxGroup(
              labels: <String>[
                "完全不會",
                "幾乎不會",
                "經常會",
                "偶爾會",
                "會",
              ],
              labelStyle: TextStyle(
                  fontFamily: 'GFSDidot',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF818181),
                  fontSize: 20),
              activeColor: Colors.grey[700],
              checked: checked,
              onSelected: onSelected,
              onChange: (bool isChecked, String label, int index) => print(
                  "isChecked: $isChecked   label: $label  index: $index"),
            ),
          ],)
      ),
    );
  }
}