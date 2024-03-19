import 'package:flutter/material.dart';

class TColors {
  TColors._();

  //App basic color
  static const primary = Color(0xffaee7ff);
  static const secondary = Color(0xffFBF9F1);
  static const accent = Color(0xffB4D4FF);

  //Text color
  static const textPrimary = Color(0xff333333);
  static const textSecondary = Color(0xff6c757d);
  static const textWhite = Color(0xffffffff);

  //Background color
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  //Background container color
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  //Border color
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecondary = Color(0xffe6e6e6);

  //Error and Validation color
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);

  //Neutral shades
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const grayV1 = Color(0xffededed);
  static const grayV3 = Color(0xffc6c6c6);
  static const grayV5 = Color(0xff898989);
  static const grayV7 = Color(0xff4d4d4d);
  static const grayV9 = Color(0xff1b1b1b);
  static const green = Color(0xff19f68c);
  static const red = Color(0xffff3131);
  static const blue = Color(0xffaee7ff);
  static const darkBlue = Color(0xff004561);
  static const lightBlue = Color(0xffe6f2f7);
  static const mediumBlue = Color(0xff08abec);
}
