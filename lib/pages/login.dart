import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mp_board/common/formfield.dart';
import 'package:mp_board/main.dart';
import 'package:mp_board/pages/signup.dart';

// 로그인 페이지
class Login extends StatelessWidget {
  const Login({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '게시판',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
            height: 2,
            width: 500.0,
            color: Colors.black,
            margin: EdgeInsets.only(top: 30, bottom: 30),
          ),
          // 로그인 입력 폼

          Formfield(),
          Formfield(),
          // 로그인 버튼
          Container(
            width: 350,
            height: 50,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(161, 113, 255, 1),
            ),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  '계정이 없으신가요?',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (() => Get.to(() => SignUp())),
                  child: Text(
                    '가입하기',
                    style: TextStyle(
                      color: Color.fromRGBO(161, 113, 255, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
