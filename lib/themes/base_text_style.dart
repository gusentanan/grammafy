import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/utils/font_family.dart';

// Display, Headline, Title, Body, Label
// Type. Large, Medium, Small
extension BaseTextStyle on TextStyle {
  static TextStyle displayLarge = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 57.sp,
    height: 1.12, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle displayMedium = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 45.sp,
    height: 1.15, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 36.sp,
    height: 1.22, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle headlineLarge = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 32.sp,
    height: 1.25, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle headlineMedium = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 28.sp,
    height: 1.28, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle headlineSmall = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 24.sp,
    height: 1.33, // Adjusted line height
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle titleLarge = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 22.sp,
    height: 1.27, // Adjusted line height
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle titleMedium = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 16.sp,
    height: 1.5, // Adjusted line height
    letterSpacing: 0.15.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle titleSmall = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 14.sp,
    height: 1.43, // Adjusted line height
    letterSpacing: 0.1.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle bodyLarge = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 16.sp,
    height: 1.5, // Adjusted line height
    letterSpacing: 0.15.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 14.sp,
    height: 1.43, // Adjusted line height
    letterSpacing: 0.25.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle bodySmall = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 12.sp,
    height: 1.67, // Adjusted line height
    letterSpacing: 0.4.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle labelLarge = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 14.sp,
    height: 1.43, // Adjusted line height
    letterSpacing: 0.1.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle labelMedium = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 12.sp,
    height: 1.33, // Adjusted line height
    letterSpacing: 0.5.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle labelSmall = TextStyle(
    fontFamily: FontFamily.golos,
    fontSize: 11.sp,
    height: 1.45, // Adjusted line height
    letterSpacing: 0.1.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
