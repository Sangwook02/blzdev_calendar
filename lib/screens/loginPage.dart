import 'package:blzdev_calendar/screens/mainPage.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  static String id = 'loginpage';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 160, 205, 242),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Text(
              "Blzdev Calendar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 39, 56, 154)),
            )),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                decoration: InputDecoration(hintText: ' 아이디'),
              ),
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: ' 비밀번호',
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage()));
              },
              child: Text("로그인"),
              style: ElevatedButton.styleFrom(primary: Colors.blue, padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            )
          ],
        )));
  }
}
