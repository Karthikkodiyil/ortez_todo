import 'package:flutter/material.dart';
import 'package:ortez_machine_test/utils/app_color.dart';

class AppStyles {
  // Singleton instance
  static final AppStyles _instance = AppStyles._internal();

  factory AppStyles() {
    return _instance;
  }

  AppStyles._internal();

  static TextStyle _baseTextStyle(
      Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'poppins',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  TextStyle get blackSemi18 => _baseTextStyle(kBlack, 18.0, FontWeight.w800);
  TextStyle get blackRegular14 => _baseTextStyle(kBlack, 14.0, FontWeight.w400);
  TextStyle get blackMedium14 => _baseTextStyle(kBlack, 14.0, FontWeight.w800);

  TextStyle get blackMedium15 => _baseTextStyle(kBlack, 15.0, FontWeight.w600);
  TextStyle get whiteRegular14 => _baseTextStyle(kWhite, 14.0, FontWeight.w400);

}
