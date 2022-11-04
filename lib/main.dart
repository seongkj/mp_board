import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_board/pages/login.dart';
import 'package:mp_board/pages/signup.dart';
import 'package:mp_board/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // useMaterial3: true,
        scaffoldBackgroundColor: Color.fromRGBO(243, 235, 255, 1),
      ),
      initialRoute: '/',
      routes: {
        Login.route: (context) => Login(),
        SignUp.route: (context) => SignUp(),
      },
      title: '게시판',
      home: StartPage(),
    );
  }
}
