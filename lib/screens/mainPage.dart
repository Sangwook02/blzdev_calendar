import 'package:blzdev_calendar/screens/projectPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class mainPage extends StatefulWidget {
  static String id = 'mainPage';

  @override
  State<mainPage> createState() => _mainPageState();
}

CalendarBuilders _customCalendar = CalendarBuilders();

class _mainPageState extends State<mainPage> {
  DateTime selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 205, 242),
      appBar: AppBar(
        title: Text("blzdev calendar"),
        backgroundColor: Color.fromARGB(255, 48, 162, 255),
      ),
      body: TableCalendar(
        rowHeight: 100,
        focusedDay: DateTime.now(),
        firstDay: DateTime(2020, 1, 1),
        lastDay: DateTime(2035, 12, 31),
        locale: 'ko-KR',
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          print("selected" + selectedDay.year.toString() + " " + selectedDay.month.toString() + " " + selectedDay.day.toString());
          // 선택된 날짜의 상태를 갱신합니다.
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (DateTime d) {
          return isSameDay(selectedDay, d);
        },
        daysOfWeekHeight: 30,
        calendarBuilders: _customCalendar,
        headerStyle: HeaderStyle(
          titleCentered: true,
          // delete 2weeks
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
            canMarkersOverflow: false,
            markersAutoAligned: true,
            markersMaxCount: 3,
            markerDecoration: BoxDecoration(
              //모양, 색깔
              color: Colors.blueAccent,
              shape: BoxShape.rectangle,
            ),
            isTodayHighlighted: true,
            todayDecoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
              height: 80.0,
            ),
            ListTile(
              title: Text("project1"),
              onTap: () {
                print("project1로 이동");
                Navigator.push(context, MaterialPageRoute(builder: (context) => projectPage()));
              },
            ),
            ListTile(
              title: Text("project2"),
              onTap: () {
                print("project2로 이동");
                Navigator.push(context, MaterialPageRoute(builder: (context) => projectPage()));
              },
            ),
            ListTile(
              title: Text("project3"),
              onTap: () {
                print("project3로 이동");
                Navigator.push(context, MaterialPageRoute(builder: (context) => projectPage()));
              },
            ),
            ListTile(
              title: Text("project4"),
              onTap: () {
                print("project4로 이동");
                Navigator.push(context, MaterialPageRoute(builder: (context) => projectPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
