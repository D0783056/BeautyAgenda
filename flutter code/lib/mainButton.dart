import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final Function onPress;
  Button({@required this.name, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(70, 30, 0, 5),
      height: 45.0,
      width: 125.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        color: Colors.grey[300],
        child: Text(
          "$name",
          style: TextStyle(
              fontFamily: 'GFSDidot',
              fontSize: 20.0,
              color: Colors.grey[700]),
        ),
        onPressed: onPress,
      ),
    );
  }
}

