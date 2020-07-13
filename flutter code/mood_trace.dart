import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'emoji.dart';
import 'emojiCount.dart';

// ignore: must_be_immutable
class MoodTracePage extends StatefulWidget {
  int angry;
  int sad;
  int normal;
  int happy;
  int joy;
  MoodTracePage(this.angry, this.sad, this.normal, this.happy, this.joy);

  @override
  MoodTracePageState createState() =>
      new MoodTracePageState(angry, sad, normal, happy, joy);
}

class MoodTracePageState extends State<MoodTracePage> {
  final kActiveColor = Colors.grey;
  final kInactiveColor = Colors.black12;
  int angry;
  int sad;
  int normal;
  int happy;
  int joy;
  MoodTracePageState(this.angry, this.sad, this.normal, this.happy, this.joy);

  DateTime _currentDate = DateTime(2020, 7, 3);
  DateTime _currentDate2 = DateTime(2020, 7, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 7, 3));
  DateTime _targetDateTime = DateTime(2020, 7, 3);
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
    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
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
      selectedDateTime: _currentDate2,
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
      todayButtonColor: Colors.green,
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

    return new Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Color(0xFFFFD0D1),
              leading: IconButton(
                icon: Icon(Icons.person),
                iconSize: 40,
                onPressed: () {},
              ),
              title: Center(
                child: Text(
                  '心情追蹤',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'GFSDidot',
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  iconSize: 40,
                  onPressed: () {},
                ),
              ],
            ),
            preferredSize: Size.fromHeight(60)),
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
                    SizedBox(width: 80.0),
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
              Card(
                margin: EdgeInsets.fromLTRB(40, 5, 35, 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 240,
                  width: 400,
                  color: Colors.black12,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("本月目前的情緒統計: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'GFSDidot',
                                  color: const Color(0xFF818181))),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text("$angry次憤怒情緒",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFSDidot',
                              color: const Color(0xFF818181))),
                      Text("$sad次悲傷情緒",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFSDidot',
                              color: const Color(0xFF818181))),
                      Text("$normal次平常心情",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFSDidot',
                              color: const Color(0xFF818181))),
                      Text("$happy次開心情緒",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFSDidot',
                              color: const Color(0xFF818181))),
                      Text("$joy次歡樂情緒",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GFSDidot',
                              color: const Color(0xFF818181))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
