import 'package:flutter/material.dart';

class LoginPageStyle {
  static BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Color(0xFFFBCA19),
    );
  }

  static TextStyle titleTextStyle() {
    return TextStyle(
      fontSize: 32,
      color: Color(0xFF2B2B2B),
      fontFamily: 'Racing_Sans_One',
    );
  }

  static BoxDecoration textFieldDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }
}
