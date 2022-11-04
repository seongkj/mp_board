import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mp_board/pages/mainpage.dart';

// 게시글 읽기 페이지
class Read extends StatelessWidget {
  const Read({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 1000,
                height: 70,
                margin: EdgeInsets.only(top: 30, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(217, 201, 248, 1),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (() => Get.to(() => MainPage())),
                          child: Text('게시판')),
                      Icon(Icons.more_horiz, size: 35),
                    ],
                  ),
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: '저장된 제목',
                      ),
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
                        hintText: '저장된 내용',
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
                    OutlinedButton(
                      onPressed: null,
                      child: Text('댓글등록'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
