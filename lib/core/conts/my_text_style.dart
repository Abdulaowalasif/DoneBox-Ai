import 'package:flutter/material.dart';

class MyTextStyle {
  /// Responsive helper function
  static double _scaleFont(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    // Scale font size based on screen width
    return baseSize * (width / 390); // 390 is a common design baseline (iPhone 12)
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
}
