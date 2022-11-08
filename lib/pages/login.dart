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
          // Formfield(
          //   type: FormFieldType.email,
          // ),
          // Formfield(
          //   type: FormFieldType.password,
          // ),
          Form(
            // key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 350,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    key: ValueKey(4),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return '이메일 형식으로 입력해주세요.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '이메일',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    key: ValueKey(5),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return '비밀번호는 8자 이상 입력해주세요.';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '비밀번호',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

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
