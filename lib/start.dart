import 'package:flutter/material.dart';

import 'package:mp_board/pages/login.dart';
import 'package:mp_board/pages/mainpage.dart';
import 'package:mp_board/pages/read.dart';
import 'package:mp_board/pages/signup.dart';
import 'package:mp_board/pages/writing.dart';
import 'package:mp_board/pages/testpage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text('로그인페이지'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text('회원가입페이지'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text('메인페이지'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Writing()),
                  );
                },
                child: Text('글쓰기페이지'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Read()),
                  );
                },
                child: Text('게시글페이지'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestPage()),
                  );
                },
                child: Text('테스트페이지'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
