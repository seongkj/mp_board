import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final names = TextEditingController();
  final emails = TextEditingController();
  final passwords = TextEditingController();
  final passwordChecks = TextEditingController();

  void registerUser(String email, String password) {}
}
