import 'BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'skin_change.dart';

class Skin extends StatelessWidget {
  int id;
  Skin(this.id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatelessWidget(id),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  int id;
  MyStatelessWidget(this.id);
  String username;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:false,
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Color(0xFFFFD0D1),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigation(id),
                ),
              );
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          title: Center(
            child: Text(
              '膚況變化',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'GFSDidot',
              ),
            ),
          ),
        ),
        body: Skin_change(id),
      ),
    );
  }
}