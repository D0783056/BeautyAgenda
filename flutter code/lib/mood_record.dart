import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:beauty_agenda/emoji.dart';
import 'mood_trace.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.dart';
import 'bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum mood { angry, sad, normal, happy, joy }

class MoodRecordPage extends StatefulWidget {
  @override
  MoodRecordPageState createState() => new MoodRecordPageState();
}

class MoodRecordPageState extends State<MoodRecordPage> {
  mood selectedMood;
  final kActiveColor = Colors.grey;
  final kInactiveColor = Colors.black12;
  int angry = 0;
  int sad = 0;
  int normal = 0;
  int happy = 0;
  int joy = 0;
  int temp;
  int angry1 = 0;
  int sad1 = 0;
  int normal1 = 0;
  int happy1 = 0;
  int joy1 = 0;
  int id;
  var nowTime = new DateTime.now();
  String year;

  _readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'id';
    final value = prefs.getInt(key) ?? 0;
    setState(() {
      id = value;
    });
  }

  _saveAngry() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "angry";
    var value1 = prefs.getInt(key) ?? 0;
    value1++;
    angry1 = value1;
    prefs.setInt(key, value1);
    var value2 = prefs.get("sad") ?? 0;
    sad1 = value2;
    var value3 = prefs.get("normal") ?? 0;
    normal1 = value3;
    var value4 = prefs.get("happy") ?? 0;
    happy1 = value4;
    var value5 = prefs.get("joy") ?? 0;
    joy1 = value5;
  }

  _saveSad() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "sad";
    var value1 = prefs.getInt(key) ?? 0;
    value1++;
    sad1 = value1;
    prefs.setInt(key, value1);
    var value2 = prefs.get("angry") ?? 0;
    angry1 = value2;
    var value3 = prefs.get("normal") ?? 0;
    normal1 = value3;
    var value4 = prefs.get("happy") ?? 0;
    happy1 = value4;
    var value5 = prefs.get("joy") ?? 0;
    joy1 = value5;
  }

  _saveNormal() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "normal";
    var value1 = prefs.getInt(key) ?? 0;
    value1++;
    normal1 = value1;
    prefs.setInt(key, value1);
    var value2 = prefs.get("angry") ?? 0;
    angry1 = value2;
    var value3 = prefs.get("sad") ?? 0;
    sad1 = value3;
    var value4 = prefs.get("happy") ?? 0;
    happy1 = value4;
    var value5 = prefs.get("joy") ?? 0;
    joy1 = value5;
  }

  _saveHappy() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "happy";
    var value1 = prefs.getInt(key) ?? 0;
    value1++;
    happy1 = value1;
    prefs.setInt(key, value1);
    var value2 = prefs.get("angry") ?? 0;
    angry1 = value2;
    var value3 = prefs.get("sad") ?? 0;
    sad1 = value3;
    var value4 = prefs.get("normal") ?? 0;
    normal1 = value4;
    var value5 = prefs.get("joy") ?? 0;
    joy1 = value5;
  }

  _saveJoy() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "joy";
    var value1 = prefs.getInt(key) ?? 0;
    value1++;
    joy1 = value1;
    prefs.setInt(key, value1);
    var value2 = prefs.get("angry") ?? 0;
    angry1 = value2;
    var value3 = prefs.get("sad") ?? 0;
    sad1 = value3;
    var value4 = prefs.get("normal") ?? 0;
    normal1 = value4;
    var value5 = prefs.get("happy") ?? 0;
    happy1 = value5;
  }

  DateTime _currentDate = DateTime(2020, 11, 3);
  DateTime _currentDate2 = DateTime(2020, 11, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 11, 3));
  DateTime _targetDateTime = DateTime(2020, 11, 3);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 2, 10): [
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    _readId();

    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2020, 2, 25),
        new Event(
          date: new DateTime(2020, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2020, 2, 10),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2020, 2, 11), [
      new Event(
        date: new DateTime(2020, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NavDrawerExample navDrawerExample = new NavDrawerExample(id);

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Color(0xFF818181),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 350.0,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
      CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.black,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.grey,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Scaffold(
      appBar: Toptitle().Topbar(context, "心情追蹤", id),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //custom icon
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarousel,
            ), // This trailing comma makes auto-formatting nicer for build methods.
            //custom icon without header
            Container(
              margin: EdgeInsets.only(
                top: 30.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: new Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    iconSize: 40,
                    color: const Color(0xFF818181),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month - 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                  SizedBox(width: 55.0),
                  Expanded(
                      child: Text(
                        _currentMonth,
                        style: TextStyle(
                          fontFamily: 'GFSDidot',
                          color: const Color(0xFF818181),
                          fontSize: 30.0,
                        ),
                      )),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    iconSize: 40,
                    color: const Color(0xFF818181),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(
                            _targetDateTime.year, _targetDateTime.month + 1);
                        _currentMonth =
                            DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarouselNoHeader,
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 20,
                  color: Color(0xFFFFD0D1),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${nowTime.year} / ${nowTime.month} / ${nowTime.day}', //TODO 要用變數!!
                  style: TextStyle(
                    color: const Color(0xFF818181),
                    fontSize: 23,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Emoji(
              mood: '憤怒    ヽ(#`Д´)ﾉ',
              onPress: () {
                setState(() {
                  selectedMood = mood.angry;
                });
                print(selectedMood);
              },
              colour:
              selectedMood == mood.angry ? kActiveColor : kInactiveColor,
            ), // TODO 表情記得改!!
            Emoji(
              mood: '悲傷..     ( ´;ω;` )',
              onPress: () {
                print(selectedMood);
                setState(() {
                  selectedMood = mood.sad;
                });
                print(selectedMood);
              },
              colour: selectedMood == mood.sad ? kActiveColor : kInactiveColor,
            ),
            Emoji(
              mood: '平常心       (*’ｰ’*)',
              onPress: () {
                setState(() {
                  selectedMood = mood.normal;
                });
              },
              colour:
              selectedMood == mood.normal ? kActiveColor : kInactiveColor,
            ),
            Emoji(
              mood: '小開心    (｡◕∀◕｡)',
              onPress: () {
                setState(() {
                  selectedMood = mood.happy;
                });
              },
              colour:
              selectedMood == mood.happy ? kActiveColor : kInactiveColor,
            ),
            Emoji(
              mood: '超歡樂ヽ(✿ﾟ▽ﾟ)ノ',
              onPress: () {
                setState(() {
                  selectedMood = mood.joy;
                });
              },
              colour: selectedMood == mood.joy ? kActiveColor : kInactiveColor,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(110, 30, 50, 30),
              height: 55.0,
              width: 150.0,
              child: RaisedButton(
                color: const Color(0xFFFFD0D1),
                child: Text(
                  "儲存",
                  style: TextStyle(
                      fontFamily: 'GFSDidot',
                      fontSize: 25.0,
                      color: Colors.white),
                ),
                onPressed: () async {
                  if (selectedMood == mood.angry) {
                    _saveAngry();
                    angry++;
                  } else if (selectedMood == mood.sad) {
                    _saveSad();
                    sad++;
                  } else if (selectedMood == mood.normal) {
                    _saveNormal();
                    normal++;
                  } else if (selectedMood == mood.happy) {
                    _saveHappy();
                    happy++;
                  } else if (selectedMood == mood.joy) {
                    _saveJoy();
                    joy++;
                  } else {
                    Fluttertoast.showToast(
                      msg: "請先點選今天的心情!", backgroundColor: Colors.grey,);
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MoodTracePage(angry1, sad1, normal1, happy1, joy1),
                    ),
                  );
                  print("Tapped a Container");
                },
              ),
            ),
          ],
        ),
      ),
      drawer: navDrawerExample.drawer(context),
    );
  }
}