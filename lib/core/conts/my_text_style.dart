import 'package:flutter/material.dart';

class MyTextStyle {
  static double _scaleFont(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    return baseSize * (width / 390);
  }

  static TextStyle onboardingText1(BuildContext context) => TextStyle(
    fontSize: _scaleFont(context, 24),
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle onboardingText2(BuildContext context) => TextStyle(
    fontSize: _scaleFont(context, 28),
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle w7s16() =>
      TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 16);

  static TextStyle w4s16() =>
      TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16);

  static TextStyle w7s20() =>
      TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20);

  static TextStyle w5s14() =>
      TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14);

  static TextStyle w5s20() =>
      TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20);
  static TextStyle w5s18() =>
      TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20);
}
