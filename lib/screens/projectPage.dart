import 'package:blzdev_calendar/screens/mainPage.dart';
import 'package:blzdev_calendar/screens/newSchedulePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class projectPage extends StatefulWidget {
  const projectPage({Key? key}) : super(key: key);

  @override
  State<projectPage> createState() => _projectPageState();
}

CalendarBuilders _customCalendar = CalendarBuilders();

class _projectPageState extends State<projectPage> {
  DateTime selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 205, 242),
      appBar: AppBar(
        title: Text("project"),
        backgroundColor: Color.fromARGB(255, 48, 162, 255),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage()));
            },
            icon: Icon(Icons.home),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          )
        ],
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
          showData(selectedDay, context);
        },
        selectedDayPredicate: (DateTime d) {
          return isSameDay(selectedDay, d);
        },
        daysOfWeekHeight: 30,
        calendarBuilders: _customCalendar,
        headerStyle: const HeaderStyle(
          titleCentered: true,
          // delete 2weeks
          formatButtonVisible: false,
        ),
        calendarStyle: const CalendarStyle(
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
              },
            ),
            ListTile(
              title: Text("project2"),
              onTap: () {
                print("project2로 이동");
              },
            ),
            ListTile(
              title: Text("project3"),
              onTap: () {
                print("project3로 이동");
              },
            ),
            ListTile(
              title: Text("project4"),
              onTap: () {
                print("project4로 이동");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
          Navigator.push(context, MaterialPageRoute(builder: (context) => newSchedulePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showData(DateTime selectedDay, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: 600.0,
            height: 800.0,
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      "project_schedule",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Align(alignment: Alignment.topRight, child: IconButton(onPressed: () {}, icon: Icon(Icons.add)))
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 330.0,
                            width: 500.0,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 206, 206, 206), borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50.0,
                    ),
                    Text(
                      "dev_log",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 67.5,
                    ),
                    Align(alignment: Alignment.topRight, child: IconButton(onPressed: () {}, icon: Icon(Icons.add)))
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 330.0,
                            width: 500.0,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 206, 206, 206), borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: ListBody(children: []),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //SafeArea(child: ListView.builder(itemBuilder: itemBuilder))
              ],
            ),
          ),
        );
      });
}
