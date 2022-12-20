import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  static String id = 'mainPage';

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 205, 242),
      appBar: AppBar(
        title: Text("blzdev calendar"),
        backgroundColor: Color.fromARGB(255, 48, 162, 255),
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
    );
  }
}
