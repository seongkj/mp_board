import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:mp_board/common/formfield.dart';
import 'package:mp_board/main.dart';
import 'package:mp_board/pages/mainpage.dart';
import 'package:mp_board/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String route = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authentication = FirebaseAuth.instance;

  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  User? loggedUser;

  void _tryValidaton() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  String userEmail = '';
  String userPassword = '';

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
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
            Form(
              key: _formKey,
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
                      onSaved: (value) {
                        userEmail = value!;
                      },
                      onChanged: (value) {
                        userEmail = value;
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
                      onSaved: (value) {
                        userPassword = value!;
                      },
                      onChanged: (value) {
                        userPassword = value;
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
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  _tryValidaton();
                  try {
                    final newUser =
                        await _authentication.signInWithEmailAndPassword(
                      email: userEmail,
                      password: userPassword,
                    );
                    if (newUser != null) {
                      setState(() {
                        showSpinner = false;
                      });
                      Get.toNamed(MainPage.route);
                      print('로그인 성공');
                    }
                  } catch (e) {
                    print(e);
                    print('로그인 실패');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('로그인에 실패했습니다.'),
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
                    color: Color.fromRGBO(161, 113, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
      ),
    );
  }
}
