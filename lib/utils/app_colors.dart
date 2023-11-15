import 'package:flutter/material.dart';

class AppColors {
  static const secondary = Color(0xFFFFD700);
  static const primary = Color(0xFFFDBB12);
  static const systemColor = Color(0xFFD9D9D9);
  static const bgColor = Color(0xFFF6F6F6);
  static const black = Colors.black;
  static const lightBlack = Color(0xFF212630);
  static const grey = Color(0xFFC0C0C0);
  static const lightGrey = Color(0xFF9491A1);
  static const white = bgColor;
  static const blue = Color(0xFF000080);
  static const lightBlue = Color(0xFF107AF7);
  static const shadowColor = Color(0xFF000000);
  static const orange = Color(0xFFF76631);
  static const blueBlack = Color(0xFF32475CDE);
  static const blueGrey = Color(0xFF32475C);
  static const darkGrey = Color(0xFF575757);
  static const pinkYellowGradient = LinearGradient(
      colors: [Color(0xFFC62866), Color(0xFFF5AE60)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const blueBlackGradient = LinearGradient(
      colors: [Color(0xff0707B4), black],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const blueSmoothGradient = LinearGradient(
      colors: [Color(0xff0707B4), Color(0xFF020242)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const goldenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.secondary, AppColors.primary],
  );
}
