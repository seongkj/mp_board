import 'package:flutter/material.dart';

enum FormFieldType { email, password, passwordCheck, name }

class Formfield extends StatelessWidget {
  const Formfield({super.key, required this.type});
  final FormFieldType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: type == FormFieldType.password ||
            type == FormFieldType.passwordCheck,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: FormFieldType.email == type
              ? '이메일'
              : FormFieldType.password == type
                  ? '비밀번호'
                  : FormFieldType.passwordCheck == type
                      ? '비밀번호 확인'
                      : null,
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
    );
  }
}
