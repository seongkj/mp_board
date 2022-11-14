import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mp_board/pages/writing.dart';
import 'package:mp_board/pages/login.dart';

// 게시판 메인 페이지
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String route = '/mainpage';

  @override
  Widget build(BuildContext context) {
    final _authentication = FirebaseAuth.instance;

    return Scaffold(
      body: Column(
        children: [
          // 상단 네비바
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
                    child: Text('게시판'),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (() => Get.to(() => Writing())),
                        child: Text('글쓰기'),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _authentication.signOut();
                          Get.to(() => Login());
                        },
                        child: Text('로그아웃'),
                      ),
                      Icon(Icons.more_horiz, size: 35),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 메인 컨텐츠
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 게시판 목록 column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 790,
                    // height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('번호')),
                        DataColumn(label: Text('제목')),
                        DataColumn(label: Text('작성자')),
                        DataColumn(label: Text('작성일')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('게시글 제목')),
                          DataCell(Text('닉네임')),
                          DataCell(Text('22-11-02')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('게시글 제목')),
                          DataCell(Text('닉네임')),
                          DataCell(Text('22-11-02')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('게시글 제목')),
                          DataCell(Text('닉네임')),
                          DataCell(Text('22-11-02')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('게시글 제목')),
                          DataCell(Text('닉네임')),
                          DataCell(Text('22-11-02')),
                        ]),
                      ],
                    ),
                  ),
                  // 글쓰기 버튼
                  OutlinedButton(
                    onPressed: (() => Get.to(() => Writing())),
                    child: Text('글쓰기'),
                  ),
                ],
              ),
              // 사이드 네비바 column
              Container(
                width: 200,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 201, 248, 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('profile.png'),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 201, 248, 1),
                      ),
                      child: Text('검색'),
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 201, 248, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
