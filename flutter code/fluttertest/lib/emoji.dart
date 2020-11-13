import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  final Color colour;
  final String mood;
  final Function onPress;
  Emoji({@required this.mood,this.colour, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        margin: EdgeInsets.fromLTRB(70, 15, 50, 10),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          height: 60,
          width: 240,
          color: colour,
          child: Text("$mood",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'GFSDidot',
                  color: const Color(0xFF818181))),
        ),
      ),
    );
  }
}

