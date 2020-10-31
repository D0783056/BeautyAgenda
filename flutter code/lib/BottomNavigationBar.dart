import 'homepage.dart';
import 'package:flutter/material.dart';
import 'take_picture_screen.dart';
import 'mood_record.dart';
import 'daymenu.dart';
import 'week.dart';
import 'login.dart';

class BottomNavigation extends StatelessWidget {
  // This widget is the root of your application.
  int id, page;
  BottomNavigation(this.id);

  void pushToCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(id),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text('Do you want to log out?'),
          actions: [
            FlatButton(
                child: Text('Yes',style: TextStyle(color: const Color(0xFF818181))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
            ),
            FlatButton(
              child: Text('No',style: TextStyle(color: const Color(0xFF818181))),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavigationBarExample(id),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  int id;
  BottomNavigationBarExample(int id){
    this.id = id;
  }
  //const BottomNavigationBarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState(id);
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 2;
  int id;
  _BottomNavigationBarExampleState(int id){
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      CameraScreen(id),MoodRecordPage(),HomePage(id),DaymenuPage(),Week(id)
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.camera, size: 35,), title: text('膚況檢測')),
      BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 35,), title: text('心情追蹤')),
      BottomNavigationBarItem(icon: Icon(Icons.home,size: 40,), title: text('主頁面')),
      BottomNavigationBarItem(icon: Icon(Icons.today,size: 35,), title: text('每日養顏')),
      BottomNavigationBarItem(icon: Icon(Icons.date_range,size:35,), title: text('每週養顏')),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor:  Colors.grey[200],
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
      selectedItemColor: Colors.grey[850],

    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}

Widget text(String name) {
  return Text(name);
}