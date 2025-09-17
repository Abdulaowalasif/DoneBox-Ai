import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static double _scaleFont(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    return baseSize * (width / 390);
  }

  static TextStyle onboardingText1(BuildContext context) => GoogleFonts.poppins(
    fontSize: _scaleFont(context, 24),
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle onboardingText2(BuildContext context) => GoogleFonts.poppins(
    fontSize: _scaleFont(context, 28),
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle w7s16() => GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 16,
  );

  static TextStyle w4s16() => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
  );
  static TextStyle w4s12() => GoogleFonts.poppins(
    fontWeight: FontWeight.w200,
    color: Colors.black,
    fontSize: 12,
  );

  static TextStyle w7s20() => GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 20,
  );

  static TextStyle w5s14() => GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14,
  );

  static TextStyle w5s16() => GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
  );

  static TextStyle w5s20() => GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
  );

  static TextStyle w5s18() => GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 18,
  );

  static TextStyle w4s18() => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 18,
  );

  static TextStyle w6s30() => GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 30,
  );

  static TextStyle appIcon() => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 22,
  );
}
