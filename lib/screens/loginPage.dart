import 'dart:convert';
import 'dart:io';

import 'package:blzdev_calendar/models/user.dart';
import 'package:blzdev_calendar/screens/newSchedulePage.dart';
import 'package:http/http.dart' as http;
import 'package:blzdev_calendar/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:http_status_code/http_status_code.dart';

class loginPage extends StatefulWidget {
  static String id = 'loginpage';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  User user = User(id: "", name: "", token: "");
  @override
  Widget build(BuildContext context) {
    final username = TextEditingController();
    final password = TextEditingController();
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
                controller: username,
              ),
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: ' 비밀번호',
                ),
                controller: password,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                List login = await loginAPI(username.text, password.text);
                if (login[0] == StatusCode.CREATED) {
                  user.token = login[3];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => mainPage(
                                user: user,
                              )));
                }
              },
              child: Text("로그인"),
              style: ElevatedButton.styleFrom(primary: Colors.blue, padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80)),
            )
          ],
        )));
  }
}

Future<List> loginAPI(String username, String password) async {
  var url = Uri.http('127.0.0.1:8000', '/user/login/');
  http.Response response = await http.post(url,
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Access-Control-Allow-Headers, Content-Type, Authorization',
        'Access-Control-Allow-Methods': 'POST',
        "Content-Type": "application/json"
      },
      body: jsonEncode({'username': username, "password": password}));
  //return response.statusCode;

  /*
   * response.body는 post request가 성공했을 때만 가능함.
   * 따라서, if문을 사용.
   */
  if (response.statusCode == StatusCode.CREATED) {
    return [response.statusCode, username, "name", jsonDecode(response.body)['token']];
  } else {
    // 필수 기능 구현 후에 showDialog를 이용해 로그인 실패 문구 띄우기.
    return [response.statusCode];
  }
}
