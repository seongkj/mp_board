import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mp_board/common/formfield.dart';
import 'package:mp_board/pages/login.dart';
import 'package:mp_board/controllers/signup_controller.dart';
import 'package:mp_board/pages/mainpage.dart';

// 회원가입 페이지
class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String route = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    // 사용자 등록, 인증에 사용
    final _authentication = FirebaseAuth.instance;
    final _formKey = GlobalKey<FormState>();

    void _tryValidaton() {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
      }
    }

    String userName = '';
    String userEmail = '';
    String userPassword = '';
    String userPasswordCheck = '';

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '게시판',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          Container(
            height: 2,
            width: 500.0,
            color: Colors.black,
            margin: EdgeInsets.only(top: 30, bottom: 30),
          ),
          // 회원가입 정보 입력 폼
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 350,
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    key: ValueKey(1),
                    validator: (value) {
                      if (value!.length < 2) {
                        return '닉네임은 2자 이상 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userName = value!;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '닉네임',
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
                    key: ValueKey(2),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return '이메일 형식으로 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userEmail = value!;
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
                    key: ValueKey(3),
                    validator: (value) {
                      if (value!.length < 6) {
                        return '비밀번호는 8자 이상 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPassword = value!;
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

          // 회원가입 버튼
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                _tryValidaton();
                try {
                  final newUser =
                      await _authentication.createUserWithEmailAndPassword(
                    email: userEmail,
                    password: userPassword,
                  );
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(newUser.user!.uid)
                      .set({
                    'userName': userName,
                    'email': userEmail,
                  });

                  if (newUser != null) {
                    Get.toNamed(MainPage.route);
                    print('회원가입 성공');
                  }
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('회원가입에 실패했습니다.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Container(
                width: 350,
                height: 50,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(161, 113, 255, 1),
                ),
                child: Center(
                  child: Text(
                    '회원가입',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  '계정이 있으신가요?',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (() => Get.to(() => Login())),
                  child: Text(
                    '로그인하기',
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



/////비밀번호 확인 란 
// Container(
                //   width: 350,
                //   margin: EdgeInsets.only(bottom: 20),
                //   child: TextFormField(
                //     // controller: controller.passwordCheck,
                //     key: ValueKey(3),
                //     validator: (value) {
                //       if (value!.isEmpty || value.length < 6) {
                //         return '비밀번호는 8자 이상 입력해주세요.';
                //       }
                //       return null;
                //     },
                //     onSaved: (value) {
                //       userPasswordCheck = value!;
                //     },
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.white,
                //       hintText: '비밀번호확인',
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide(width: 2, color: Colors.blue),
                //       ),
                //     ),
                //   ),
                // )
