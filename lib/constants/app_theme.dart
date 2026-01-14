import 'package:flutter/material.dart';

class AppColors {
  // Background & Surface
  static const Color background = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFFFFFFF);
  
  // Text
  static const Color textPrimary = Color(0xFF323232);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textHint = Color(0xFF666666);
  
  // UI Elements
  static const Color border = Color(0xFF323232);
  static const Color iconColor = Color(0xFF323232);
  
  // Accent & Focus
  static const Color accent = Color(0xFF8B9556);
  static const Color inputFocus = Color(0xFF2d8cf0);
}

class AppSizes {
  static const double borderRadius = 5.0;
  static const double buttonHeight = 55.0;
  static const double inputPadding = 15.0;
  static const double spacing = 20.0;
  static const double borderWidth = 2.0;
}

class AppShadows {
  static List<BoxShadow> elevated = [
    const BoxShadow(
      color: Color(0xFF323232),
      offset: Offset(4, 4),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> pressed = [
    const BoxShadow(
      color: Color(0xFF323232),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> none = [];
}
