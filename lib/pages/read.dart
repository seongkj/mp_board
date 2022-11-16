import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mp_board/pages/mainpage.dart';

// 게시글 읽기 페이지
class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  final _firestore = FirebaseFirestore.instance;
  String title = '';
  String content = '';
  final storyData = FirebaseFirestore.instance
      .collection('storys/dgZxjw1uoKr5ZlzZbzEc/story')
      .doc('QYIoKw9p8JHuAX2dsvA7')
      .get();

  getData() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore
            .collection('storys/dgZxjw1uoKr5ZlzZbzEc/story')
            .doc('QYIoKw9p8JHuAX2dsvA7')
            .get();
    final Map<String, dynamic> data = documentSnapshot.data()!;
    print(data);
    print(data['title']);

    final result = await _firestore
        .collection('storys/dgZxjw1uoKr5ZlzZbzEc/story')
        .doc('QYIoKw9p8JHuAX2dsvA7')
        .get();
    print(result.data());
    print(result['title']);
    title = result['title'];
    content = result['content'];

    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final String testText = '저장된 제목';

    final testData = _firestore
        .collection('storys/dgZxjw1uoKr5ZlzZbzEc/story')
        .doc('QYIoKw9p8JHuAX2dsvA7')
        .get();

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
                      TextButton(
                        onPressed: () async {
                          getData();
                        },
                        child: Text("데이터 가져오기"),
                      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      height: 1,
                      width: 700,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 400,
                      child: Text(content,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.all(10),
                    //     enabledBorder: InputBorder.none,
                    //     focusedBorder: InputBorder.none,
                    //     hintText: '저장된 내용',
                    //   ),
                    //   style: TextStyle(fontSize: 20),
                    //   maxLines: 18,
                    // ),
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
