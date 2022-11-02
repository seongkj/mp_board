import 'package:flutter/material.dart';

class Writing extends StatelessWidget {
  const Writing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text(
              '게시판',
              style: TextStyle(fontSize: 20),
            ),
            Container(),
            Container(
              height: 2,
              width: 1000,
              color: Colors.black,
              margin: EdgeInsets.only(top: 30, bottom: 30),
            ),
            Container(
              width: 800,
              height: 600,
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'title'),
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                  ),
                  Container(
                    height: 1,
                    width: 700,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '내용',
                    ),
                    style: TextStyle(fontSize: 20),
                    maxLines: 18,
                  ),
                  Container(
                    height: 1,
                    width: 700,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
