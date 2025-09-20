import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static double _scaleFont(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    return baseSize * (width / 390); // 390 = base width
  }

  // Onboarding texts
  static TextStyle onboardingText1(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontSize: _scaleFont(context, 24),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle onboardingText2(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontSize: _scaleFont(context, 28),
        fontWeight: FontWeight.w700,
        color: color,
      );

  // General reusable styles
  static TextStyle w7s16(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: color,
        fontSize: _scaleFont(context, 16),
      );

  static TextStyle w4s16(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: _scaleFont(context, 16),
      );

  static TextStyle w4s12(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w200,
        color: color,
        fontSize: _scaleFont(context, 12),
      );

  static TextStyle w7s20(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: color,
        fontSize: _scaleFont(context, 20),
      );

  static TextStyle w5s14(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: _scaleFont(context, 14),
      );

  static TextStyle w5s16(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: _scaleFont(context, 16),
      );

  static TextStyle w5s18(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: _scaleFont(context, 18),
      );

  static TextStyle w5s20(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: _scaleFont(context, 20),
      );

  static TextStyle w4s18(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: _scaleFont(context, 18),
      );

  static TextStyle w6s30(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: _scaleFont(context, 30),
      );

  static TextStyle appIcon(BuildContext context, {Color color = Colors.black}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: _scaleFont(context, 22),
      );
}